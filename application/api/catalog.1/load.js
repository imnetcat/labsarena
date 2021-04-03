({
  access: 'public',
  method: async ({ filters }) => {
    if(!filters) {
      const data = await domain.db.select('equipment', ['*']); 
      return { result: 'success', data };
    } else {
      let where = [];
      fields = ['*'];
      let query = 'SELECT * FROM "equipment" WHERE ';
      if(filters.country) {
        query += 'country' + country;
      }

      let tags = '';
      let firstit = true;
      for(let tag of filters.tags) {
        if(!firstit) {
          tags += ' OR ';
        }
        tags += ' tagid=' + tag;
      }
      const tags_filtered = await domain.db.query(`SELECT * FROM equipmenttags WHERE ${tags}`); 
      
      console.log(tags_filtered)

      const data = await domain.db.select('equipment', fields, where); 
      return { result: 'success', data };
    }
  }
});
