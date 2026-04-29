# Snowflake Analytics Delivery MVP Logistics EDW

## Objective  
This project is a simple Minimum Viable Product (MVP) of an analytics delivery platform built on Snowflake. The goal is to simulate a real-world, production-style data environment that enables scalable data ingestion, transformation, and consumption while enforcing proper data governance and access control.  

It is currently a work in progress and mirrors a completed client project, adapted for portfolio demonstration purposes.

## Overview  
The platform is designed to demonstrate how modern data teams deliver analytics using a structured, modular, and cloud-native approach. It incorporates key components such as role-based access control, layered data modeling, and transformation workflows to reflect best practices in data engineering.

## Key Features  

- **Snowflake Data Warehouse**  
  Centralized cloud data platform for scalable storage and compute.

- **Role-Based Access Control (RBAC)**  
  Structured user roles and permissions to control data access across environments.

- **dbt Transformations**  
  Modular, version-controlled data transformations enabling clean, reusable data models.

- **Medallion Architecture**  
  Data is organized into Bronze (raw), Silver (cleaned), and Gold (business-ready) layers for clarity and scalability.

- **AWS Integration**  
  Data ingestion and staging through AWS services (S3), supporting ELT workflows.

- **Snowflake Cortex Models**  
  Integration of Snowflake-native AI/ML capabilities to enable advanced analytics and intelligent data interactions.

## Purpose  
This MVP is intended to:  
- Demonstrate end-to-end data pipeline design  
- Showcase modern data stack integration (Snowflake + dbt + AWS)  
- Reflect real client-facing architecture in a simplified format  
- Serve as a foundation for future enhancements (automation, orchestration, dashboards)

## Status  
🚧 **In Progress** — This project is actively being developed and will continue to evolve with additional features, optimizations, and production-level enhancements.

## Future Enhancements  
- Orchestration (AWS storage bucket, Snowpipe Ingestion)  
- CI/CD for dbt pipelines  
- Dashboard integration (Power BI )  
- Enhanced monitoring and logging with quota limitations 
- Expanded data sources and use cases  


<img src="gbdemo.png" width="900px">
<img src="snow.png" width="900px">
<img src="aws.png" width="900px">
