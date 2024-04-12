CREATE TABLE "User"(
    "id" UUID NOT NULL,
    "username" VARCHAR(255) NOT NULL,
    "password" VARCHAR(255) NOT NULL,
    "email" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "User" ADD PRIMARY KEY("id");
CREATE TABLE "Area_of_growth"(
    "id" UUID NOT NULL,
    "area" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "Area_of_growth" ADD PRIMARY KEY("id");
CREATE TABLE "Mental_workout"(
    "id" UUID NOT NULL,
    "user" UUID NOT NULL,
    "challenge" UUID NULL,
    "completed" BOOLEAN NOT NULL
);
ALTER TABLE
    "Mental_workout" ADD PRIMARY KEY("id");
CREATE TABLE "split_preference"(
    "id" BIGINT NOT NULL,
    "push_pull_legs" BOOLEAN NOT NULL,
    "bro_split" BOOLEAN NOT NULL,
    "push_pull" BIGINT NOT NULL
);
ALTER TABLE
    "split_preference" ADD PRIMARY KEY("id");
CREATE TABLE "Set"(
    "id" UUID NOT NULL,
    "reps" BIGINT NOT NULL,
    "weight" BIGINT NOT NULL,
    "exercise" UUID NOT NULL
);
ALTER TABLE
    "Set" ADD PRIMARY KEY("id");
CREATE TABLE "User_profile"(
    "id" UUID NOT NULL,
    "age" BIGINT NOT NULL,
    "weight" DECIMAL(5, 2) NOT NULL,
    "bio" TEXT NOT NULL,
    "picture" geography(POINT, 4326) NOT NULL,
    "user" UUID NOT NULL,
    "split_preference" UUID NOT NULL
);
ALTER TABLE
    "User_profile" ADD PRIMARY KEY("id");
CREATE TABLE "Exercise"(
    "id" UUID NOT NULL,
    "split" UUID NOT NULL,
    "physical_workout" UUID NOT NULL,
    "minimum_sets" BIGINT NOT NULL
);
ALTER TABLE
    "Exercise" ADD PRIMARY KEY("id");
CREATE TABLE "Book"(
    "id" BIGINT NOT NULL,
    "title" VARCHAR(255) NOT NULL,
    "preview" VARCHAR(255) NOT NULL,
    "price" DECIMAL(5, 2) NOT NULL,
    "url" VARCHAR(255) NOT NULL,
    "reading_exercise" UUID NOT NULL
);
ALTER TABLE
    "Book" ADD PRIMARY KEY("id");
CREATE TABLE "Physical_workout"(
    "id" UUID NOT NULL,
    "user" UUID NOT NULL,
    "date_completed" TIMESTAMP(0) WITHOUT TIME ZONE NULL,
    "challenge" UUID NULL,
    "title" VARCHAR(255) NOT NULL,
    "completed" BOOLEAN NOT NULL
);
ALTER TABLE
    "Physical_workout" ADD PRIMARY KEY("id");
CREATE TABLE "Challenge"(
    "id" UUID NOT NULL,
    "date" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL
);
ALTER TABLE
    "Challenge" ADD PRIMARY KEY("id");
CREATE TABLE "reading_exercise"(
    "id" UUID NOT NULL,
    "start_time" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "end_time" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "mental_workout" UUID NOT NULL,
    "area_of_growth" UUID NOT NULL
);
ALTER TABLE
    "reading_exercise" ADD PRIMARY KEY("id");
ALTER TABLE
    "Physical_workout" ADD CONSTRAINT "physical_workout_challenge_foreign" FOREIGN KEY("challenge") REFERENCES "Challenge"("id");
ALTER TABLE
    "Physical_workout" ADD CONSTRAINT "physical_workout_user_foreign" FOREIGN KEY("user") REFERENCES "User"("id");
ALTER TABLE
    "Mental_workout" ADD CONSTRAINT "mental_workout_challenge_foreign" FOREIGN KEY("challenge") REFERENCES "Challenge"("id");
ALTER TABLE
    "reading_exercise" ADD CONSTRAINT "reading_exercise_mental_workout_foreign" FOREIGN KEY("mental_workout") REFERENCES "Mental_workout"("id");
ALTER TABLE
    "Mental_workout" ADD CONSTRAINT "mental_workout_user_foreign" FOREIGN KEY("user") REFERENCES "User"("id");
ALTER TABLE
    "User_profile" ADD CONSTRAINT "user_profile_user_foreign" FOREIGN KEY("user") REFERENCES "User"("id");
ALTER TABLE
    "Exercise" ADD CONSTRAINT "exercise_physical_workout_foreign" FOREIGN KEY("physical_workout") REFERENCES "Physical_workout"("id");
ALTER TABLE
    "User_profile" ADD CONSTRAINT "user_profile_split_preference_foreign" FOREIGN KEY("split_preference") REFERENCES "split_preference"("id");
ALTER TABLE
    "Set" ADD CONSTRAINT "set_exercise_foreign" FOREIGN KEY("exercise") REFERENCES "Exercise"("id");
ALTER TABLE
    "reading_exercise" ADD CONSTRAINT "reading_exercise_area_of_growth_foreign" FOREIGN KEY("area_of_growth") REFERENCES "Area_of_growth"("id");
ALTER TABLE
    "Book" ADD CONSTRAINT "book_reading_exercise_foreign" FOREIGN KEY("reading_exercise") REFERENCES "reading_exercise"("id");
ALTER TABLE
    "Exercise" ADD CONSTRAINT "exercise_split_foreign" FOREIGN KEY("split") REFERENCES "split_preference"("id");