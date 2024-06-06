# Shopify Product Sync

Ruby Version: 3.3.0
Rails Version: 7.1.3

Rails application for managing job postings and job applications. It includes controllers for fetching and presenting job and application data, along with associated models to represent jobs, applications, and their respective events.

### Key files

    
    job-application-management
    │
    ├── app
    │   ├── controllers
    │   │   └── api
    │   │       └── v1
    │   │           ├── applications_controller.rb
    │   │           └── jobs_controller.rb
    │   │
    │   ├── models
    │   │   ├── application.rb
    │   │   └── job.rb
    │   │
    │   └── services
    │       ├── applications_service.rb
    │       └── jobs_service.rb
    │
    ├── config
    │   └── routes.rb
    │
    ├── spec
    │   └── controllers
    │       └── api
    │           └── v1
    │               ├── applications_controller_spec.rb
    │               └── jobs_controller_spec.rb
    │
    ├── Gemfile
    ├── Gemfile.lock
    └── README.md

    

## Workflow

The workflow of the application is as follows:

### Jobs Management

- Jobs are managed through the `JobsController`.
- The `index` action retrieves job data, including associated events such as hiring and rejection events.
- Job data is aggregated and transformed into a JSON response for client consumption.

### Applications Management

- Applications are managed through the `ApplicationsController`.
- The `index` action fetches application data based on activated jobs.
- Application data includes details such as the candidate's name, application status, number of notes, and interview date.
- Like the `JobsController`, the `ApplicationsController` generates a JSON response for client consumption.

### Modularization and Performance

- To improve performance, the logic for generating responses in both controllers is modularized.
- Separate service classes (`JobsService` and `ApplicationsService`) encapsulate the logic for fetching and processing data.
- This modular approach enhances code maintainability and allows for better performance optimization and scalability.

### Error Handling

- Both controllers include error handling mechanisms to gracefully handle exceptions and return appropriate error responses.
- If an error occurs during data retrieval or processing, the controllers respond with an error message and an internal server error status code.


**Setup**

* first clone the directory 
                      ```
                      git clone git@github.com:sajjadmurtaza/ats_event_sourcing.git
                      ```
 *  ```cd ats_event_sourcing```


 *  ```bundle install ```

 *  ```rails db:create```

 *  ```rails db:migrate```

  *  ```rails db:seed```

 *  ```rails s ```


OPTIONAL: To Test Locally Use ngrok, https://ngrok.com/download, after install ngrock rub
*  ```ngrok http 3000```

* Set config.hosts << "<NGROK URL>" ```config/environments/development.rb```

e.g. ```config.hosts << "5f90-113-203-226-180.ngrok-free.app""```

 ***


### Specs

run ``` bundle exe rspec   ``` to run the tests


## Testing Endpoints

### Jobs Endpoint:

- Open Postman.
- Make a GET request to the `/api/v1/jobs` endpoint (e.g., [http://localhost:3000/api/v1/jobs](http://localhost:3000/api/v1/jobs)).
- Verify that you receive a JSON response containing job data.

### Applications Endpoint:

- Make a GET request to the `/api/v1/applications` endpoint (e.g., [http://localhost:3000/api/v1/applications](http://localhost:3000/api/v1/applications)).
- Verify that you receive a JSON response containing application data.
