### Gym

A local practice has asked you to build a piece of software to help them to manage patient diagnoses.


### User Stories / Acceptance Criteria - MVP

#### Manage Patients

As a clinician 
I want to document each diagnosis of a disease in a patient
So I can store their disease history and monitor their patterns of disease over time

Clinicians should be able to:
	 create a patient
	 edit a patient


#### Manage Diseases

As a clinician
I want to manage a list of diseases
So that I know which diseases are known, reclasssified or no longer relevant and can access their details

Clinicians should be able to:
	insert a new disease
	edit a disease
	delete a disease
	

#### Assign a disease diagnosis to a patient

As a clinician
I want to assign a patient a particular disease
So that I can give a diagnosis

A clinician should be able to assign a patient a disease

#### View all patients with a particualr disease

As a clinician
I want to see all patients with a particular disease
So that I determine the frequncy of disease

A clinician should be able to view a list of patients with a specific type of disease 

### User Stories - Possible Extensions

Association between disease and profession
As a clinician 
I want to see which disease is the most frequent in a particular age group / profession
So I can establish if a particular profession if more prone to a particular disease
A clinician should be able to see which profession has the most diagnoses

Identify whether the diagnosis has been resolved or is ongoing
As a clinician I want to mark a diagnosis as treated/resolved 
So I can maintain an up-to-date record of current/active/ongoing diseases 
A clinicina should be able to assigned a diagnosis as either active or resolved diagnoses
A clinician should be able to view all active or all resoved diagnoses

Rank each patient by sickeness factor
As a clinicain I want to rank patients by disease severity nly on those with with active / unresolved diagnoses 
So I can detect the sickest patient
A clinician shoud be able to identify the sickest patient by factoring the disease potential danger x actual disease severity rating. NB a patient could have multiple diagnoses; some active and some resolved; the sickness rating should only factor in active diagnoses

