import axios from "axios";

// const API_URL = process.env.API_URL || "http://localhost:3000";

// `baseURL` is prepended to URLs passed to axios
// axios.defaults.baseURL = API_URL;

// POST with JSON content type
axios.defaults.headers.post["Content-Type"] = "application/json";

// `xsrfCookieName` is the name of the cookie
// to use as a value for xsrf token.
// Default is 'XSRF-TOKEN'
axios.defaults.xsrfCookieName = "CSRF-TOKEN";

// `xsrfHeaderName` is the name of the http header
// that carries the xsrf token value.
// Default is 'X-XSRF-TOKEN'
axios.defaults.xsrfHeaderName = "X-CSRF-Token";

// `withCredentials` indicates whether or not cross-site
// Access-Control requests should be made using credentials.
axios.defaults.withCredentials = true;

export default {
  getUsers() {
    return axios.get('/api/v1/users/search');
  },
  whoAmI() {
    return axios.get('/api/v1/users/info');
  },
  signOut() {
    return axios.post('/api/v1/users/sign_out');
  },
  signUp(params) {
    return axios.post('/api/v1/users', params)
  },
  signIn(params) {
    return axios.post('/api/v1/users/sign_in', params)
  }
};
