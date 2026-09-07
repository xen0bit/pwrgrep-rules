const axios = require('axios');

const Query = {
  user(parent, args, context, info) {
    // ruleid: apollo-axios-ssrf
    return axios.request('/api/user', {params: {id: args.id}});
  },
  repo(parent, args, context, info) {
    // ruleid: apollo-axios-ssrf
    return axios.get(args.url);
  },
  version() {
    // ok: apollo-axios-ssrf
    return axios.get('https://api.example.com/version');
  },
  health() {
    // ok: apollo-axios-ssrf
    return 'ok';
  }
};
