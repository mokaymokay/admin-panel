# Magic Admin Panel
## User-friendly admin panel for a magical bootcamp

## Built with:
* Ruby on Rails
* PostgreSQL

## Demo login:
* Username: adumbledore@hogwarts.com
* Password: muggles

## Screenshots:
User Dashboard:
![dashboard](github/dashboard.png)

Example CRUD page:
![assign-students-to-cohort](github/assign-students-to-cohort.png)

## Basic functionality:
* Authentication with Devise - two types of users: Admins (full privileges) and Instructors (limited privileges)
* Admins can CRUD students, instructors, admins, courses, and cohorts
* Instructors can only view resources (except for each other's salary and age), assign/remove students to/from their own cohorts, and edit grades for their own cohorts

## User-friendly features:
* AJAX calls for all CRUD actions resulting in limited redirects/reloads and improved site performance
* Modal forms for AJAX CRUD actions (add, edit, delete)
* Quick links on dashboard for Admins to add resources
* Color-coordinated buttons and flash messages based on resource type and CRUD action
* Dynamic side navigation buttons for each course and their cohorts
* Ability to add cohorts directly from side navigation for specific course
* Breadcrumbs and links throughout site for smooth navigation
* Meaningful icons, favicon, and signed in user identification

## Acknowledgements
* Credits: [Start Bootstrap](https://github.com/BlackrockDigital/startbootstrap-sb-admin), [Hogwarts Logo](http://arilitv.com/harry-potter-coloring-page/harry-potter-coloring-page-hogwarts-crest-pages-cute/)
* Inspiration: Harry Potter
