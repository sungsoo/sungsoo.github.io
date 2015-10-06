#!/usr/bin/env python

import os
os.environ['DJANGO_SETTINGS_MODULE'] = 'settings'

from django.conf import settings
from models import *

Author.objects.all().delete()

f = open('/Users/sanjayk/Documents/Research/sampleclean-eps/code/samplecleanpipelines/datasets/PaperAuthor-reg.csv','r')
line = f.readline()
while line != "":
	comps = line.split(",")
	try:
		paperid = int(comps[0])
		authorid = int(comps[1])
		name = comps[2]
		affiliation = comps[3:]
	except:
		paperid = -1
		authorid = -1
		name = 'Unknown'
		affiliation = 'Unknown'

	a = Author(paperid= paperid, authorid=authorid, name=name, affiliation = affiliation)
	a.save()


	line = f.readline()
