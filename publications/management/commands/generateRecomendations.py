from publications.models import SDAEUser, Publication, Recomendation, Vote
from django.contrib.auth.modes import User
from django.core.management.base import BaseCommand, CommandError, NoArgsCommand

  # Get Recomendations list
def getRecomendations(targetUser):
  users = SDAEUser.objects.all()
  publications = Publication.objects.all()
  targetUserVotes = Vote.objects.filter(author=targetUser)

  if len(targetUserVotes) == 0:
    return

  targetUserVotesDict = {}
  userSimilarity = {}

  for vote in targetUserVotes:
    targetUserVotesDict[vote.publication] = vote

  for user in users:
    if user == targetUser:
      continue

    userSimilarity.setdefault(user, 0)
    userVotes = Vote.objects.filter(author=user)

    for publication in publications:
      for vote in userVotes:
        # print str(vote.isPositive) + " " + str(vote)
        if vote.publication == publication:
          targetVote = targetUserVotesDict.get(publication)
          if targetVote != None and targetVote.isPositive == vote.isPositive:
            userSimilarity[user] += 1

  #Get the users with the most similar user votes to the target user
  maxSim = max(userSimilarity.values())

  similarUsers = []
  for k, v in userSimilarity.iteritems():
    if v == maxSim:
      similarUsers.append(k)

  recomendations = []
  for similarUser in similarUsers:
    referenceUserVotes = Vote.objects.filter(author=similarUser)

    recomendationsScore = {}

    for referenceVote in referenceUserVotes:
      if targetUserVotesDict.get(referenceVote.publication) == None:
        if recomendationsScore.get(referenceVote.publication) == None:
          recomendationsScore.setdefault(referenceVote.publication, 0)
        if referenceVote.isPositive:
          recomendationsScore[referenceVote.publication] += 1
        else:
          recomendationsScore[referenceVote.publication] -= 1

  for publication, score in recomendationsScore.iteritems():
    if score >= 0:
      recomendations.append(publication)

  return recomendations

class Command(NoArgsCommand):
  help = "Crea recomendaciones de publicaciones para todos los usuarios"

  def handle(self, *args, **options):
    users = SDAEUser.objects.all()

    for user in users:
      createRecomendationsForUser(user)

# Create recomendations registers in DB
def createRecomendations():
  users = SDAEUser.objects.all()

  for user in users:
    createRecomendationsForUser(user)

def createRecomendationsForUser(user):
  recomendations = getRecomendations(user)

  recsCount = 0

  for recomendation in recomendations:
    existingRecomendations = Recomendation.objects.filter(sdaeuser = user)
    publicationsFromExistingRecs = []
    for existingRec in existingRecomendations:
      publicationsFromExistingRecs.append(existingRec.publication)
    if not recomendation in publicationsFromExistingRecs:
      recsCount += 1
      r = Recomendation(sdaeuser = user, publication=recomendation)
      r.save()
