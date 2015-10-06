from django.http import HttpResponse
from django.shortcuts import render_to_response, get_object_or_404
from django.template import Context, RequestContext, loader
from django.template.loader import get_template
from django.db.models import Count
from models import *
from django.db.models import Q
import string
import re
import json

def home(request):
	
	clearClean()
	loadDirty()
	#clean1()
	#resetClean()
	clean1(1)
	clean3(2)
	clean2(3)
	clean4(4)
	allString()

	#compressProposal()

	return render_to_response("index.html", {"author_list": AffiliationClean.objects.all()},
    context_instance=RequestContext(request))


def clearClean():
	AffiliationClean.objects.all().delete()

def loadDirty(samplesize=200):
	affset = Author.objects.filter(Q(affiliation__contains='Stanford') | Q(affiliation__contains='Berkeley')).exclude(affiliation = '[\' \\n\']').values('paperid','affiliation').order_by('?')[:samplesize]
	for a in affset:
		b = AffiliationClean(affiliation_dirty = a['affiliation'], affiliation_clean = json.dumps({'~':a['affiliation']}))
		b.save()

def resetClean():
	for a in AffiliationClean.objects.all():
		k = a.affiliation_dirty
		a.affiliation_clean = json.dumps({'~': k})
		a.kid1 = False
		a.kid2 = False
		a.kid3 = False
		a.kid4 = False
		a.save()

def saveClean(a, kid):
	#if kid == 1 :
	#	a.k1 = True
	#elif kid == 2 :
	#	a.k2 = True
	#elif kid == 3 :
	#	a.k3 = True
	#elif kid == 4 :
	#	a.k4 = True

	a.save()


def clean1(kid):
	for a in AffiliationClean.objects.all():
		k = json.loads(a.affiliation_clean)
		for k1 in json.loads(a.affiliation_clean):
			k[k1+","+str(kid)] = clean1String(k[k1])

		a.affiliation_clean = json.dumps(k)
		a.save()

def clean1String(k):
	return k[3:len(k)-4]

def clean2(kid):
	for a in AffiliationClean.objects.all():
		k = json.loads(a.affiliation_clean)
		for k1 in json.loads(a.affiliation_clean):
			comps = k[k1].split('|')
			if len(comps) > 1:
				k[k1+","+str(kid)] = next((x for x in comps if 'university' in x.lower()), comps[1])
		
		a.affiliation_clean = json.dumps(k)
		a.save()

def clean3(kid):
	for a in AffiliationClean.objects.all():
		k = json.loads(a.affiliation_clean)
		for k1 in json.loads(a.affiliation_clean):
			if k[k1].find("Department") < k[k1].find("University"):
				p = k[k1][k[k1].find("University"):]
				if 'of' in p:
					k[k1+","+str(kid)] = p
			elif k[k1].find("Department") > 0:
				p = k[k1][:k[k1].find("Department")]
				k[k1+","+str(kid)] = p
		
		a.affiliation_clean = json.dumps(k)
		a.save()

def clean4(kid):
	for a in AffiliationClean.objects.all():
		k = json.loads(a.affiliation_clean)
		for k1 in json.loads(a.affiliation_clean):
			comps = k[k1].split()
			cleaned_comps = []
			active = False
			for c in comps:
				if c == 'U.':
					cleaned_comps.append('University')
					active = True
				elif c == 'Dept.':
					cleaned_comps.append('Department')
					active = True
				elif c == 'Coll.':
					cleaned_comps.append('College')
					active = True
				else:
					cleaned_comps.append(c)

			k[k1+","+str(kid)] = ' '.join(cleaned_comps)

		a.affiliation_clean = json.dumps(k)
		a.save()

def compressProposal():
	
	for a in AffiliationClean.objects.all():
		out = {}
		inv_map = {}
		for k, v in json.loads(a.affiliation_clean).iteritems():
			inv_map[v] = inv_map.get(v, [])
			inv_map[v].append(k)

		for i in inv_map:
			#print inv_map
			out[inv_map[i][0]] = i

		
		a.affiliation_clean = json.dumps(out)
		a.save()

def jaccardSim(s1,s2):
	strings1 = set(re.split('\W+',s1))
	strings2 = set(filter(lambda x: len(x) > 2,re.split('\W+',s2)))
	return (len(strings1.intersection(strings2))+0.0)/(len(strings2.union(strings1))+1.0)

def totalJaccardSim(a,s1):
	sumi = 0
	n = 0
	for k, v in json.loads(a.affiliation_clean).iteritems():
		sumi = sumi + jaccardSim(s1,v)
		n= n+1
	#print sumi/n
	return sumi/n

def allString():
	for a in AffiliationClean.objects.all():
		max_count = 0
		max_heur = '~'
		max_val = ''

		long_heur = 0
		long_val = '~'

		for k,v in json.loads(a.affiliation_clean).iteritems():

			c = 0
			for b in AffiliationClean.objects.all():
				c = c + totalJaccardSim(b,v)

			if c >= max_count:
				max_count = c
				max_heur = k
				max_val = v

			if len(k) >= long_heur:
				long_val = v
				long_heur = len(k)

		if '1' in max_heur:
			a.k1 = True

		if '2' in max_heur:
			a.k2 = True

		if '3' in max_heur:
			a.k3 = True

		if '4' in max_heur:
			a.k4 = True

		print a.affiliation_clean

		a.affiliation_final = max_val.strip()
		a.affiliation_compare = long_val.strip()
		a.save()
		#print a.affiliation_clean
		#print max_val, max_heur, max_count
		



