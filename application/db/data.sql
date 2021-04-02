INSERT INTO "SystemUser" ("login", "password") VALUES
  ('admin', '$scrypt$N=32768,r=8,p=1,maxmem=67108864$XcD5Zfk+BVIGEyiksBjjy9LL42AFOOqlhEB650woECs$3CNOs25gOVV8AZMYQc6bFnrYdM+3xP996shxJEq5LxGt4gs1g9cocZmi/SYg/H16egY4j7qxTD/oygyEI80cgg'),
  ('marcus', '$scrypt$N=32768,r=8,p=1,maxmem=67108864$aGKuH5D2zndi6zFu74/rEj5m3u5kRh5b+QXYfKrhAU8$257up1h/3R9CoxH2382zX0+kbxRPrd+GwzJIxYI+K+gBYCcLrA8Z6wv7lSwLElfbDTJRgUhQJFhMT1tpp5AJxw'),
  ('user', '$scrypt$N=32768,r=8,p=1,maxmem=67108864$z5uf2xGdpgq5v2sZbgh36QoZG9CDmGmJUNJkrs1zs2w$3s3x22k4Td0jkup4WduFQGFVjrFKHjN1WV9k8/Bh3DKI58Wrlo/D4Js9j/DiskwI8rltDd8pF15JylivFu2T0g');

-- |  login    |     password    |

--    admin           123456
--   marcus           marcus
--    user          nopassword

INSERT INTO "SystemGroup" ("name") VALUES
  ('admins'),
  ('users'),
  ('guests');

INSERT INTO "SystemGroupSystemUser" ("systemGroupId", "systemUserId") VALUES
  (1, 1),
  (2, 2),
  (2, 3);


INSERT INTO "Service" ("name") VALUES
  ('Sharing/Collaboration'),
  ('For Rent'),
  ('For Sale'),
  ('Second Hand Equipment'),
  ('Paid Services');

INSERT INTO "Equipment" ("url", "name", "country", "city", "institute", "service", "approved") VALUES
  ('https://www.intibs.pl/en/the-institute/research/division-of-nanomaterials-chemistry-and-catalysis.html', 'Philips CM-20 SuperTwin transmission electron microscope: accelerating voltage of 200 kV, resolution of 0.24 nm.', 'Poland', 'Wroclaw', 'INTIBS PAN, Division of Nanomaterials Chemistry and Catalysis Laboratory of Electron Microscopy', 1, true);
