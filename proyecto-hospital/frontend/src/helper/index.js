export function isNotAuthenticated(to, from, next) {
  if (typeof localStorage !== 'undefined') {
    return localStorage.getItem('admin-login') ? next('/') : next();
  }
}
export function isAuthenticated(to, from, next) {
  if (typeof localStorage !== 'undefined') {
    return localStorage.getItem('admin-login') ? next() : next('/login/');
  }
}
