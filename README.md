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
    * A user can make payments for tasks done


### Installation Guide
* Clone this repository [here](https://github.com/blackdevelopa/ProjectSupport.git).
* The develop branch is the most stable branch at any given time, ensure you're working from it.
* Run bundle install to install all dependencies


#### API Endpoints
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| POST | /user/signup | To sign up a new user account |
| POST | /user/login | To login an existing user account |
| POST | /user/user_role | To add a user role on user create, A user can have the role of a client or handyman|
| POST | /clients/create | To create a user as client|
| POST | /handymen/create | To Create a user as a handyman |


##### Tasks
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| GET | /tasks | To get all tasks|
| GET | /tasks/search?param_name=[:param] | To search for a task|
| POST | /tasks/create | To create a new task|
| GET | /tasks/[:id]/show| To get a single task |
| PATCH | /tasks/[:id]/update | To update a single task|
| DELETE | /tasks/[:id]/destroy | To delete a single tasks |

##### Handymen
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| GET | /handymen | To get all handymen|
| GET | /handymen/search?param_name=[:param] | To search for a handyman|
| POST | /handymen/create | To create a new handyman profile|
| GET | /handymen/[:id]/show| To get a single handyman profile |
| PATCH | /handymen/[:id]/update | To update a single handyman profile|
| DELETE | /handymen/[:id]/destroy | To delete a single handyman |

##### Client
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| GET | /clients | To get all clients|
| GET | /clients/search?param_name=[:param] | To search for a client|
| POST | /clients/create | To create a new client profile|
| GET | /clients/[:id]/show| To get a single client profile |
| PATCH | /clients/[:id]/update | To update a single client profile|
| DELETE | /clients/[:id]/destroy | To delete a single client |

##### Reviews
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| GET | /reviews | To get all reviews|
| GET | /reviews/search?param_name=[:param] | To search for a review|
| POST | /reviews/create | To create a new review |
| GET | /reviews/[:id]/show| To get a single review  |
| PATCH | /reviews/[:id]/update | To update a single review |
| DELETE | /reviews/[:id]/destroy | To delete a single review |

##### Services
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| GET | /services | To get all services|
| GET | /services/search?param_name=[:param] | To search for a service|
| POST | /services/create | To create a new service |
| GET | /services/[:id]/show| To get a single service  |
| PATCH | /services/[:id]/update | To update a single service |
| DELETE | /services/[:id]/destroy | To delete a single service |

##### Job Proposals
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| GET | /job_proposals | To get all job_proposals |
| GET | /job_proposals/search?param_name=[:param] | To search for a job_proposal|
| POST | /job_proposals/create | To create a new job_proposal |
| GET | /job_proposals/[:id]/show| To get a single job_proposal |
| PATCH | /job_proposals/[:id]/update | To update a single job_proposal |
| DELETE | /job_proposals/[:id]/destroy | To delete a single job_proposal |

##### Appointments
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| GET | /appointments | To get all appointments |
| POST | /appointments/create | To create a new appointment |
| GET | /appointments/[:id]/show| To get a single appointment |
| PATCH | /appointments/[:id]/update | To update a single appointment |
| DELETE | /appointments/[:id]/destroy | To delete a single appointment |

##### Locations
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| GET | /locations | To get all locations |
| POST | /locations/create | To create a new location |

##### Images
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| POST | /upload_avatar | To upload a user profile picture |
| POST | /work_photos| To upload work images of handymen|

##### payments
| HTTP Verbs | Endpoints | Action |
| --- | --- | --- |
| POST | /stkpush | To make payment |


##### Technologies used
* Ruby on Rails

##### License
This project is available for use under the MIT License.
