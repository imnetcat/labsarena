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
  "serviceid" int generated always as identity,
  "name" varchar NOT NULl
);

ALTER TABLE "Service" ADD CONSTRAINT "pkService" PRIMARY KEY ("serviceid");
CREATE UNIQUE INDEX "akService" ON "Service" ("name");

CREATE TABLE "Tag" (
  "tagid" int generated always as identity,
  "name" varchar NOT NULl
);
ALTER TABLE "Tag" ADD CONSTRAINT "pkTag" PRIMARY KEY ("tagid");
CREATE UNIQUE INDEX "akTag" ON "Tag" ("name");

CREATE TABLE "Equipment" (
  "eid" bigint generated always as identity,
  "url" text NOT NULL,
  "name" text NOT NULL,
  "description" text,
  "country" text NOT NULL,
  "city" text NOT NULL,
  "institute" text NOT NULL,
  "approved" boolean NOT NULL
);

ALTER TABLE "Equipment" ADD CONSTRAINT "pkEquipment" PRIMARY KEY ("eid");

CREATE TABLE "EquipmentTags" (
  "tagid" int NOT NULL,
  "eid" int NOT NULL
);
ALTER TABLE "EquipmentTags" ADD CONSTRAINT "fk1EquipmentTags" FOREIGN KEY ("tagid") REFERENCES "Tag" ("tagid");
ALTER TABLE "EquipmentTags" ADD CONSTRAINT "fk2EquipmentTags" FOREIGN KEY ("eid") REFERENCES "Equipment" ("eid");


CREATE TABLE "EquipmentService" (
  "serviceid" int NOT NULL,
  "eid" int NOT NULL
);
ALTER TABLE "EquipmentTags" ADD CONSTRAINT "fk1EquipmentService" FOREIGN KEY ("serviceid") REFERENCES "Service" ("serviceid");
ALTER TABLE "EquipmentTags" ADD CONSTRAINT "fk2EquipmentService" FOREIGN KEY ("eid") REFERENCES "Equipment" ("eid");

  
  

