from django.db import models

class Author(models.Model):
    paperid  = models.IntegerField()
    authorid = models.IntegerField()
    name = models.CharField(max_length=256)
    affiliation = models.CharField(max_length=256)
    class Meta:
        app_label = 'samplecleanpipelines'

class AffiliationClean(models.Model):
    affiliation_dirty = models.CharField(max_length=256)
    affiliation_clean = models.TextField()
    affiliation_final = models.TextField()
    affiliation_compare = models.TextField()
    
    k1 = models.BooleanField(default=False)
    k2 = models.BooleanField(default=False)
    k3 = models.BooleanField(default=False)
    k4 = models.BooleanField(default=False)

    d1 = models.BooleanField(default=False)

    class Meta:
        app_label = 'samplecleanpipelines'

