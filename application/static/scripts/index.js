window.addEventListener('load', async() => {
  window.application = new Application();
  window.api = window.application.metacom.api;
  await application.mecatom.load('auth', 'console', 'example');
  const token = localStorage.getItem('metarhia.session.token');
  let logged = false;
  if(token) {
    const res = await api.auth.restore({ token });
    logged = res.status === 'logged';
  }
  


