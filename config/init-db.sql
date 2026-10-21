-- Create databases for local development
CREATE DATABASE desk_cas;
CREATE DATABASE desk_mail;
CREATE DATABASE desk_admin;
CREATE DATABASE desk_files;
CREATE DATABASE desk_calendar;
CREATE DATABASE desk_chat;

-- Grant privileges
GRANT ALL PRIVILEGES ON DATABASE desk_cas TO desk;
GRANT ALL PRIVILEGES ON DATABASE desk_mail TO desk;
GRANT ALL PRIVILEGES ON DATABASE desk_admin TO desk;
GRANT ALL PRIVILEGES ON DATABASE desk_files TO desk;
GRANT ALL PRIVILEGES ON DATABASE desk_calendar TO desk;
GRANT ALL PRIVILEGES ON DATABASE desk_chat TO desk;
