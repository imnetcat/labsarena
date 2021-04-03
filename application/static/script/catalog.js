import { Metacom } from './metacom.js';

let xrayShowed = true;
let serviceShowed = true;
let iobeamShowed = true;
let emrtShowed = true;

const showService = () => {
  document.getElementById('service').hidden = serviceShowed;
  serviceShowed = !serviceShowed;
}
const showXray = () => {
  document.getElementById('xray').hidden = xrayShowed;
  xrayShowed = !xrayShowed;
}
const showEmrt = () => {
  document.getElementById('emrt').hidden = emrtShowed;
  emrtShowed = !emrtShowed;
}
const showIobeam = () => {
  document.getElementById('iobeam').hidden = iobeamShowed;
  iobeamShowed = !iobeamShowed;
}

const loadCatalog = async (filters) => {
  const data = await window.api.catalog.load(filters);
  const catalog = document.getElementById('catalog');
  catalog.innerHTML = '';
  for(let item of data.data) {
    const a = document.createElement('a');
    a.className = 'item';
    a.target = '_blank';
    a.href = item.url;
	a.innerHTML = `<img src="./images/catalog/${item.eid}.jpg">
				<div>
					<span class="title">${item.name}</span>
					<hr>
					<span class="city">${item.country} (${item.city})</span>
					<br>
					<span class="institute">${item.institute}</span>
                    <br>
                    <span class="description">${item.description}</div>
				</div>`;

    catalog.appendChild(a);
  }
}

const applyFilters = async() => {
  const filters = new Object;
  const country = document.getElementById('country').value;
  if(country != 'all') {
    filter.country = country;
  }
  filte.tags = new Array;
  if(document.getElementById('tech-xrd').checked) {
    filter.tags.push(1);
  }
  if(document.getElementById('tech-xrf').checked) {
    filters.tags.push(2);
  }
  if(document.getElementById('tech-txrf').checked) {
    filters.tags.push(3);
  }
  if(document.getElementById('tech-saxs').checked) {
    filters.tags.push(4);
  }

  if(document.getElementById('tech-sem').checked) {
    filters.tags.push(5);
  }
  if(document.getElementById('tech-esem').checked) {
    filters.tags.push(6);
  }
  if(document.getElementById('tech-edsx').checked) {
    filters.tags.push(7);
  }
  if(document.getElementById('tech-wdsx').checked) {
    filters.tags.push(8);
  }
  if(document.getElementById('tech-esbd').checked) {
    filters.tags.push(9);
  }

  if(document.getElementById('tech-rbs').checked) {
    filters.tags.push(10);
  }
  if(document.getElementById('tech-Ebs').checked) {
    filters.tags.push(11);
  }
  if(document.getElementById('tech-Erd').checked) {
    filters.tags.push(12);
  }
  if(document.getElementById('tech-Pixe').checked) {
    filters.tags.push(13);
  }
  if(document.getElementById('tech-nra').checked) {
    filters.tags.push(14);
  }
  if(document.getElementById('tech-sims').checked) {
    filters.tags.push(15);
  }
  
  filters.service = new Object;

  filters.service.sharing = document.getElementById('service-sharing').checked;
  filters.service.rent = document.getElementById('service-rent').checked;
  filters.service.usedsale = document.getElementById('service-usedsale').checked;
  filters.service.sale = document.getElementById('service-sale').checked;
  filters.serviceexternal = document.getElementById('service-external').checked;

  await loadCatalog(filters);
}

window.addEventListener('load', async () => {
  document.getElementById('xray-lable').addEventListener('click', showXray);
  document.getElementById('service-lable').addEventListener('click', showService);
  document.getElementById('iobeam-lable').addEventListener('click', showIobeam);
  document.getElementById('emrt-lable').addEventListener('click', showEmrt);
  
  document.getElementById('apply-filters').addEventListener('click', applyFilters);

  const protocol = location.protocol === 'http:' ? 'ws' : 'wss';
  window.metacom = Metacom.create(`${protocol}://${location.host}/api`);
  window.api = window.metacom.api;
  await window.metacom.load('auth', 'catalog');
  const token = localStorage.getItem('metarhia.session.token');
  let logged = false;
  if (token) {
    const res = await api.auth.restore({ token });
    logged = res.status === 'logged';
  }
 await loadCatalog(); 
});

if (navigator.serviceWorker) {
  navigator.serviceWorker.register('/worker.js');
}

