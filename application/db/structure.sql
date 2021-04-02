CREATE TABLE "SystemUser" (
  "systemUserId" bigint generated always as identity,
  "login" varchar NOT NULL,
  "password" varchar NOT NULL,
  "fullName" varchar NULL
);

ALTER TABLE "SystemUser" ADD CONSTRAINT "pkSystemUser" PRIMARY KEY ("systemUserId");

CREATE TABLE "SystemGroup" (
  "systemGroupId" bigint generated always as identity,
  "name" varchar NOT NULL
);

ALTER TABLE "SystemGroup" ADD CONSTRAINT "pkSystemGroup" PRIMARY KEY ("systemGroupId");

CREATE TABLE "SystemGroupSystemUser" (
  "systemGroupId" bigint NOT NULL,
  "systemUserId" bigint NOT NULL
);

ALTER TABLE "SystemGroupSystemUser" ADD CONSTRAINT "pkSystemGroupSystemUser" PRIMARY KEY ("systemGroupId", "systemUserId");
ALTER TABLE "SystemGroupSystemUser" ADD CONSTRAINT "fkSystemGroupSystemUserSystemGroup" FOREIGN KEY ("systemGroupId") REFERENCES "SystemGroup" ("systemGroupId");
ALTER TABLE "SystemGroupSystemUser" ADD CONSTRAINT "fkSystemGroupSystemUserSystemUser" FOREIGN KEY ("systemUserId") REFERENCES "SystemUser" ("systemUserId");

CREATE TABLE "SystemSession" (
  "systemSessionId" bigint generated always as identity,
  "systemUserId" bigint NOT NULL,
  "token" varchar NOT NULL,
  "ip" varchar NOT NULL,
  "data" jsonb NOT NULL
);

ALTER TABLE "SystemSession" ADD CONSTRAINT "pkSystemSession" PRIMARY KEY ("systemSessionId");
ALTER TABLE "SystemSession" ADD CONSTRAINT "fkSystemSessionUser" FOREIGN KEY ("systemUserId") REFERENCES "SystemUser" ("systemUserId");


CREATE TABLE "Service" (
  "serviceId" int generated always as identity,
  "name" varchar NOT NULl
);

ALTER TABLE "Service" ADD CONSTRAINT "pkService" PRIMARY KEY ("serviceId");

CREATE UNIQUE INDEX "akService" ON "Service" ("name");

CREATE TABLE "Equipment" (
  "eid" bigint generated always as identity,
  "url" text,
  "tags" text,
  "name" text,
  "description" text,
  "country" text,
  "city" text,
  "institute" text,
  "service" int,
  "approved" boolean
);

ALTER TABLE "Equipment" ADD CONSTRAINT "pkEquipment" PRIMARY KEY ("eid");
ALTER TABLE  "Equipment" ADD CONSTRAINT "fkEquipment" FOREIGN KEY ("service") REFERENCES "Service" ("serviceId");


