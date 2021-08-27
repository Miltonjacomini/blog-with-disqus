import React from "react";
import {
  BrowserRouter as Router,
  Switch,
  Route,
  Link
} from "react-router-dom";

import Home from "./components/Home";
import AboutUs from "./components/AboutUs";
import Products from "./components/Products";
import './App.css';
import logo from './Mosaico_Logo.png';

function App() {
  return (
    <>
      <Router>
        <header>
          <nav className="Header-nav">
            <div className="nav-wrapper">
              <img className="brand-logo" src={logo} alt="Logo Mosaico"/>
              <ul id="nav-mobile" className="right hide-on-med-and-down">
                <li><Link to="/">Home</Link></li>
                <li><Link to="/about">Sobre nós</Link></li>
                <li><Link to="/products">Produtos</Link></li>
              </ul>
            </div>
          </nav>
        </header>

        <div className="App App-header">
          <Switch>
            <Route exact path="/">
              <Home />
            </Route>
            <Route path="/about">
              <AboutUs />
            </Route>
            <Route path="/products">
              <Products />
            </Route>
          </Switch>
        </div>
      </Router>
    </>
  );
}

export default App;
