import React from "react";
import ReactDOM from "react-dom";
import Root from "./root";
import Clock from "./clock";
import Tabs from "./tabs";
import Weather from "./weather";

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  const tabsObj = [
    { title: "one", content: "I am the first" },
    { title: "two", content: "Second pane here" },
    { title: "three", content: "Third pane here" }
  ];

  ReactDOM.render(
  <Root>
    <Clock />
    <Tabs info={tabsObj} />
    <Weather />
  </Root>,
  root);
});