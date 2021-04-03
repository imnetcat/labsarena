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


CREATE TABLE service (
  "serviceid" int generated always as identity,
  "name" varchar NOT NULl
);

ALTER TABLE service ADD CONSTRAINT pkservice PRIMARY KEY (serviceid);
CREATE UNIQUE INDEX akservice ON service (name);

CREATE TABLE tag (
  tagid int generated always as identity,
  name varchar NOT NULl
);
ALTER TABLE tag ADD CONSTRAINT pktag PRIMARY KEY (tagid);
CREATE UNIQUE INDEX aktag ON tag (name);

CREATE TABLE equipment (
  eid bigint generated always as identity,
  url text NOT NULL,
  name text NOT NULL,
  description text,
  country text NOT NULL,
  city text NOT NULL,
  institute text NOT NULL,
  approved boolean NOT NULL
);

ALTER TABLE equipment ADD CONSTRAINT pkequipment PRIMARY KEY (eid);

CREATE TABLE equipmenttags (
  tagid int NOT NULL,
  eid int NOT NULL
);
ALTER TABLE equipmenttags ADD CONSTRAINT fk1equipmenttags FOREIGN KEY (tagid) REFERENCES tag (tagid);
ALTER TABLE equipmenttags ADD CONSTRAINT fk2equipmenttags FOREIGN KEY (eid) REFERENCES equipment (eid);


CREATE TABLE equipmentservice (
  serviceid int NOT NULL,
  eid int NOT NULL
);
ALTER TABLE equipmentservice ADD CONSTRAINT fk1equipmentservice FOREIGN KEY (serviceid) REFERENCES service (serviceid);
ALTER TABLE equipmentservice ADD CONSTRAINT fk2equipmentservice FOREIGN KEY (eid) REFERENCES equipment (eid);

