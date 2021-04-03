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


INSERT INTO "service" ("name") VALUES
  ('Sharing/Collaboration'),
  ('For Rent'),
  ('For Sale'),
  ('Second Hand Equipment'),
  ('Paid Services');
  
INSERT INTO "tag" ("name") VALUES
  ('XRD'),
  ('XRF'),
  ('TXRR'),
  ('SAXS'),
  ('SEM'),
  ('ESEM'),
  ('TEM'),
  ('EDS/EDX'),
  ('WDS/WDXS'),
  ('EBSD'),
  ('RBS'),
  ('EBS'),
  ('ERD'),
  ('PIXE'),
  ('NRA'),
  ('SIMS');

INSERT INTO "equipment" ("url", "name", "description", "country", "city", "institute", "approved") VALUES
  ('https://www.intibs.pl/en/the-institute/research/division-of-nanomaterials-chemistry-and-catalysis.html ', 'Philips CM-20 SuperTwin transmission electron microscope', 'accelerating voltage of 200 kV, resolution of 0.24 nm', 'Poland', 'Wroclaw', 'Institute of low temperature and structure research Polish academy of sciences', true),
  ('https://www.intibs.pl/en/the-institute/research/division-of-nanomaterials-chemistry-and-catalysis.html ', 'Tesla BC 500 TEM', 'accelerating voltage 90 kV, resolution of 1.0 nm.', 'Poland', 'Wroclaw', 'Institute of low temperature and structure research Polish academy of sciences', true),
  ('https://www.intibs.pl/en/the-institute/research/division-of-nanomaterials-chemistry-and-catalysis.html ', 'FESEM FEI Nova 230 NanosSEM', 'scanning electron microscope with a resolution of 1 nm, with the possibility of working in low vacuum, equipped with a spectrometer (EDS EDAX Genesis) and a probe to study the electron backscatter diffraction (EBSD EDAX).', 'Poland', 'Wroclaw', 'Institute of low temperature and structure research Polish academy of sciences', true),
  ('https://www.intibs.pl/en/the-institute/research/division-of-nanomaterials-chemistry-and-catalysis.html ', 'Philips 515 scanning electron microscope ', 'accelerating voltage 30 kV, resolution of 5 nm) equipped with a spectrometer (EDS EDAX Genesis).', 'Poland', 'Wroclaw', 'Institute of low temperature and structure research Polish academy of sciences', true),
  ('', 'ZEISS EVO 50XVP by ZEISS Scanning electron microscope', 'Scanning electron microscope, equipped with energy dispersive X-ray spectrum analyzer INCAPenteFETx3 and HKL CHANNEL-5 system for electron diffraction produced by OXFORD.', 'Ukraine', 'Kyiv', 'Institute of Superhard Materials. V.M. Bakula of the National Academy of Sciences of Ukraine', true),
  ('http://www.uhvem.osaka-u.ac.jp/en/what.html', 'H3000 UHVEM – The 3 MV ultra-high voltage electron microscope', 'Osaka University, Research Center for Ultra-High Voltage Electron Microscopy (UHVEM)', 'Japan', 'Osaka', 'Osaka University, Research Center for Ultra-High Voltage Electron Microscopy (UHVEM)', true),
  ('https://rigaku.com/products/xrd/smartlab', 'High resolution X-Ray  Diffractometer', '', 'Estonia', 'Riga', 'The Institute of Physics for Advanced Materials, Nanotechnology and Photonics (IFIMUP)', true),
  ('https://rigaku.com/products/xrd/smartlab', 'High resolution X-Ray  Diffractometer', '', 'Estonia', 'Riga', 'Rigaku Corporation', true),
  ('https://rigaku.com/products/xrd/smartlab', 'SmartLab AUTOMATED MULTIPURPOSE X-RAY DIFFRACTOMETER (XRD) WITH GUIDANCE SOFTWARE', '', 'Estonia', 'Riga', 'Rigaku Corporation', true),
  ('https://cemup.up.pt/webcemup/IMICROS/IMICROS_lab/IMICROS_lmev.htm#REEQ', 'FEI quanta 400 FEG SEM / EDAX Genesis', 'High Resolution Environmental Scanning Electron Microscope (Schottky) ,with X-Ray Microanalysis FEI Quanta 400FEG ESEM / EDAX Genesis X4M 1.2 nm resolution', 'Portugal', 'Porto', 'MATERIALS CENTRE OF THE UNIVERSITY OF PORTO', true),
  ('https://cemup.up.pt/webcemup/IMICROS/IMICROS_lab/IMICROS_lmev.htm#REEQ', 'Kratos Axis Ultra HSA', 'High Resolution Environmental Scanning Electron Microscope (Schottky) ,with X-Ray Microanalysis FEI Quanta 400FEG ESEM / EDAX Genesis X4M  1.2 nm resolution', 'Portugal', 'Porto', 'MATERIALS CENTRE OF THE UNIVERSITY OF PORTO', true);
  
INSERT INTO "equipmentservice" ("serviceid", "eid") VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (1, 4),
  (1, 5),
  (1, 6),
  (1, 7),
  (1, 8),
  (3, 8),
  (1, 9),
  (3, 9),
  (3, 10),
  (5, 10),
  (5, 10);
  
INSERT INTO "equipmenttags" ("tagid", "eid") VALUES
  (7, 1),
  (7, 2),
  (5, 3),
  (8, 3),
  (5, 4),
  (8, 4),
  (5, 5),
  (7, 6),
  (1, 7),
  (1, 8),
  (1, 9),
  (5, 10),
  (8, 10),
  (10, 10),
  (12, 10),
  (1, 11),
  (2, 11);
