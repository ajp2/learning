import React from "react";
import GreetingContainer from "./greeting_container";
import { Route } from "react-router-dom";
import LoginFormContainer from "../components/session/login_form_container";
import SignupFormContainer from "../components/session/signup_form_container";
import { AuthRoute, ProtectedRoute } from "../util/route_util";
import SearchContainer from "../components/benches/search_container";
import BenchFormContainer from "./benches/bench_form_container";

const App = () => (
  <div>
    <header>
      <h1>Bench BnB</h1>
      <GreetingContainer />
    </header>

    <AuthRoute path="/login" component={LoginFormContainer} />
    <AuthRoute path="/signup" component={SignupFormContainer} />
    <Route exact path="/" component={SearchContainer} />
    <ProtectedRoute exact path="/benches/new" component={BenchFormContainer} />
  </div>
);

export default App
