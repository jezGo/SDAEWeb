from publications.models import Recomendation

def checkNewNotifications(request):
	sdaeuser = None

	try:
		sdaeuser = request.user.sdaeuser
	except:
		pass

	if sdaeuser == None:
		newNotificationsCount = 0
	else:
		newNotificationsCount = Recomendation.objects.filter(sdaeuser=sdaeuser, isRead=False).count()

	return {
		"plubications_newNotificationsCount" : newNotificationsCount
	}
