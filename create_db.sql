CREATE TABLE "user" (
"user_id" INT NOT NULL,
"first_name" VARCHAR2(255) NOT NULL,
"last_name" VARCHAR2(255) NOT NULL,
"gender" VARCHAR2(255) NOT NULL,
"phone_number" VARCHAR2(255) NOT NULL,
"password" VARCHAR2(255) NOT NULL,
"birth_date" DATE NOT NULL,
"city" VARCHAR2(255) NOT NULL,
"email" VARCHAR2(255) NOT NULL,
constraint USER_PK PRIMARY KEY ("user_id"));


/
CREATE TABLE "payments" (
"user_id" INT NOT NULL,
"check_id" INT NOT NULL,
"payment_date" DATE NOT NULL,
"amount" INT NOT NULL,
constraint PAYMENTS_PK PRIMARY KEY ("user_id","check_id"));


/
CREATE TABLE "orders" (
"order_id" INT NOT NULL,
"order_date" DATE NOT NULL,
"status" VARCHAR2(255) NOT NULL,
"comment" VARCHAR2(255) NOT NULL,
"user_id" INT NOT NULL,
constraint ORDERS_PK PRIMARY KEY ("order_id"));


/
CREATE TABLE "order_details" (
"order_details_id" INT NOT NULL,
"order_id" INT NOT NULL,
"prof_id" INT NOT NULL,
"course_id" INT NOT NULL,
constraint ORDER_DETAILS_PK PRIMARY KEY ("order_details_id","order_id","prof_id","course_id"));


/
CREATE TABLE "profession" (
"prof_id" INT NOT NULL,
"name" VARCHAR2(255) NOT NULL,
"description" VARCHAR2(4000) NOT NULL,
"price" FLOAT NOT NULL,
constraint PROFESSION_PK PRIMARY KEY ("prof_id"));


/
CREATE TABLE "course" (
"course_id" INT NOT NULL,
"tag_id" INT NOT NULL,
"name" VARCHAR2(255) NOT NULL,
"description" VARCHAR2(4000) NOT NULL,
"price" FLOAT NOT NULL,
constraint COURSE_PK PRIMARY KEY ("course_id"));


/
CREATE TABLE "prof_to_course" (
"prof_id" INT NOT NULL,
"course_id" INT NOT NULL,
"prof_to_course_id" INT NOT NULL,
constraint PROF_TO_COURSE_PK PRIMARY KEY ("prof_id","course_id","prof_to_course_id"));


/
CREATE TABLE "review" (
"review_id" INT NOT NULL,
"user_id" INT NOT NULL,
"prof_id" INT NOT NULL,
"course_id" INT NOT NULL,
"contents" VARCHAR2(4000) NOT NULL,
"publication_date" DATE NOT NULL,
constraint REVIEW_PK PRIMARY KEY ("review_id"));


/
CREATE TABLE "module" (
"module_id" INT NOT NULL,
"course_id" INT NOT NULL,
"name" VARCHAR2(255) NOT NULL,
"description" VARCHAR2(4000) NOT NULL,
constraint MODULE_PK PRIMARY KEY ("module_id"));


/
CREATE TABLE "curator" (
"curator_id" INT NOT NULL,
"first_name" VARCHAR2(255) NOT NULL,
"last_name" VARCHAR2(255) NOT NULL,
"phone_number" VARCHAR2(255) NOT NULL,
"gender" VARCHAR2(255) NOT NULL,
"birth_date" DATE NOT NULL,
"email" VARCHAR2(255) NOT NULL,
constraint CURATOR_PK PRIMARY KEY ("curator_id"));


/
CREATE TABLE "curator_to_module" (
"curator_to_module_id" INT NOT NULL,
"module_id" INT NOT NULL,
"curator_id" INT NOT NULL,
constraint CURATOR_TO_MODULE_PK PRIMARY KEY ("curator_to_module_id","module_id","curator_id"));


/
CREATE TABLE "speaker" (
"speaker_id" INT NOT NULL,
"gender" VARCHAR2(255) NOT NULL,
"rating" INT NOT NULL,
"phone_number" VARCHAR2(255) NOT NULL,
"first_name" VARCHAR2(255) NOT NULL,
"last_name" VARCHAR2(255) NOT NULL,
"birth_date" DATE NOT NULL,
"name" VARCHAR2(255) NOT NULL,
"email" VARCHAR2(255) NOT NULL,
"skills" VARCHAR2(255) NOT NULL,
"work_experience" VARCHAR2(255) NOT NULL,
"education" VARCHAR2(255) NOT NULL,
constraint SPEAKER_PK PRIMARY KEY ("speaker_id"));


/
CREATE TABLE "speaker_to_module" (
"speaker_to_module_id" INT NOT NULL,
"module_id" INT NOT NULL,
"speaker_id" INT NOT NULL,
constraint SPEAKER_TO_MODULE_PK PRIMARY KEY ("speaker_to_module_id","module_id","speaker_id"));


/
CREATE TABLE "video" (
"video_id" INT NOT NULL,
"module_id" INT NOT NULL,
"video_url" VARCHAR2(255) NOT NULL,
constraint VIDEO_PK PRIMARY KEY ("video_id"));


/
CREATE TABLE "test" (
"test_id" INT NOT NULL,
"module_id" INT NOT NULL,
"description" VARCHAR2(4000) NOT NULL,
"test_url" VARCHAR2(255) NOT NULL,
constraint TEST_PK PRIMARY KEY ("test_id"));


/
CREATE TABLE "practice" (
"practice_id" INT NOT NULL,
"module_id" INT NOT NULL,
"description" VARCHAR2(4000) NOT NULL,
"file_url" VARCHAR2(255) NOT NULL,
constraint PRACTICE_PK PRIMARY KEY ("practice_id"));


/
CREATE TABLE "progress" (
"progress_id" INT NOT NULL,
"user_id" INT NOT NULL,
"video_id" INT NOT NULL,
"test_id" INT NOT NULL,
"practice_id" INT NOT NULL,
"date" DATE NOT NULL,
constraint PROGRESS_PK PRIMARY KEY ("progress_id"));


/

ALTER TABLE "payments" ADD CONSTRAINT "payments_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("user_id");

ALTER TABLE "orders" ADD CONSTRAINT "orders_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("user_id");

ALTER TABLE "order_details" ADD CONSTRAINT "order_details_fk0" FOREIGN KEY ("order_id") REFERENCES "orders"("order_id");
ALTER TABLE "order_details" ADD CONSTRAINT "order_details_fk1" FOREIGN KEY ("prof_id") REFERENCES "profession"("prof_id");
ALTER TABLE "order_details" ADD CONSTRAINT "order_details_fk2" FOREIGN KEY ("course_id") REFERENCES "course"("course_id");



ALTER TABLE "prof_to_course" ADD CONSTRAINT "prof_to_course_fk0" FOREIGN KEY ("prof_id") REFERENCES "profession"("prof_id");
ALTER TABLE "prof_to_course" ADD CONSTRAINT "prof_to_course_fk1" FOREIGN KEY ("course_id") REFERENCES "course"("course_id");

ALTER TABLE "review" ADD CONSTRAINT "review_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("user_id");
ALTER TABLE "review" ADD CONSTRAINT "review_fk1" FOREIGN KEY ("prof_id") REFERENCES "profession"("prof_id");
ALTER TABLE "review" ADD CONSTRAINT "review_fk2" FOREIGN KEY ("course_id") REFERENCES "course"("course_id");

ALTER TABLE "module" ADD CONSTRAINT "module_fk0" FOREIGN KEY ("course_id") REFERENCES "course"("course_id");


ALTER TABLE "curator_to_module" ADD CONSTRAINT "curator_to_module_fk0" FOREIGN KEY ("module_id") REFERENCES "module"("module_id");
ALTER TABLE "curator_to_module" ADD CONSTRAINT "curator_to_module_fk1" FOREIGN KEY ("curator_id") REFERENCES "curator"("curator_id");


ALTER TABLE "speaker_to_module" ADD CONSTRAINT "speaker_to_module_fk0" FOREIGN KEY ("module_id") REFERENCES "module"("module_id");
ALTER TABLE "speaker_to_module" ADD CONSTRAINT "speaker_to_module_fk1" FOREIGN KEY ("speaker_id") REFERENCES "speaker"("speaker_id");

ALTER TABLE "video" ADD CONSTRAINT "video_fk0" FOREIGN KEY ("module_id") REFERENCES "module"("module_id");

ALTER TABLE "test" ADD CONSTRAINT "test_fk0" FOREIGN KEY ("module_id") REFERENCES "module"("module_id");

ALTER TABLE "practice" ADD CONSTRAINT "practice_fk0" FOREIGN KEY ("module_id") REFERENCES "module"("module_id");

ALTER TABLE "progress" ADD CONSTRAINT "progress_fk0" FOREIGN KEY ("user_id") REFERENCES "user"("user_id");
ALTER TABLE "progress" ADD CONSTRAINT "progress_fk1" FOREIGN KEY ("video_id") REFERENCES "video"("video_id");
ALTER TABLE "progress" ADD CONSTRAINT "progress_fk2" FOREIGN KEY ("test_id") REFERENCES "test"("test_id");
ALTER TABLE "progress" ADD CONSTRAINT "progress_fk3" FOREIGN KEY ("practice_id") REFERENCES "practice"("practice_id");
