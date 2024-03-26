# MAFUNDI HUB API

In response to the exponential growth of the real estate sector in Kenya, spurred by significant government investments in infrastructure development since the onset of the COVID-19 pandemic, Mafundi Hub aims to address the pressing need for maintenance services in this burgeoning industry. The real estate sector, projected to grow at a remarkable rate of 21% in 2021, has created an unprecedented demand for various essential services. As of June 2023, smartphone penetration in Kenya has increased from 54% in June 2022 to 61%, with 30.8 million smartphones and 32.1 million feature phones. With the increase in mobile penetration, Mafundi Hub aims to address the demand for handyman services with just one click.

## KEY FEATURES
#### Handyman
* ##### Authentication and Registration
    * A user can sign up, log in, logout
    * A user can register as a handyman
    * A user can upload photos of the work they have done
    * A user can upload a profile for identification purposes
    * A user can edit their profile
* ##### Tasks
    * A user can View all available tasks
    * A user can filter available jobs by:
        * Location
        * Service
     * A user can search for a specific task
     * A user can View details of a single task
     * A user can view locations of where the different tasks are located
* ##### Proposals
    * A user can send a proposal to a client to work a specific task
    * A user can view proposals they have sent and also the proposal status of each task

* #### Messages
    A user can message a handyman

  
#### Client
* ##### Authentication and Registration
    * A user can sign up, log in, logout
    * A user can register as a client
    * A user can upload photos of the work they have done
    * A user can upload a profile for identification purposes
    * A user can edit their profile
* ##### Handyman profiles
    * A user can view profiles of different handymen
    * A user can view the profile of a single handyman
    * A user can leave a review for a handyman
* #### Tasks
    * A user can create, update, and delete a task
    * A user can view tasks they have created
    * A user can view proposals sent for specific tasks, reject or accept proposal
      
* #### Appointments
    * A user can schedule an appointment
    * A user can edit and also delete an appointment
      
* #### Messages
    * A user can message a handyman
      
* #### Payments
    * A user can make payments for task done

#### API Endpoints
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| POST | /api/user/signup | To sign up a new user account |
| POST | /api/user/login | To login an existing user account |
| POST | /api/clients/create | To create a user as client|
| POST | /api/handymen/create | To Create a user as a handyman |

| POST | /api/causes | To create a new cause |
| GET | /api/causes | To retrieve all causes on the platform |
| GET | /api/causes/:causeId | To retrieve details of a single cause |
| PATCH | /api/causes/:causeId | To edit the details of a single cause |
| DELETE | /api/causes/:causeId | To delete a single cause |
