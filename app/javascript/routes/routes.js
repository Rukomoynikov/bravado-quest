import Home from '../pages/home'
import SignIn from '../pages/sign_in'
import SignUp from '../pages/sign_up'

export const routes = [
  { path: '/', component: Home },
  { path: '*', component: Home },
  { path: '/sign_in', component: SignIn },
  { path: '/sign_up', component: SignUp }
]
