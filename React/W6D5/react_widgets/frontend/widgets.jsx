import React from "react";
import ReactDOM from "react-dom";
import Root from "./root";
import Clock from "./clock";
import Tabs from "./tabs";
import Weather from "./weather";
import AutoComplete from "./autocomplete";

const tabsObj = [
  { title: "one", content: "I am the first" },
  { title: "two", content: "Second pane here" },
  { title: "three", content: "Third pane here" }
];

const names = [
  "Abba",
  "Barney",
  "Barbar",
  "Jeff",
  "Jenny",
  "Sarah",
  "Sally",
  "Xander"
]

document.addEventListener("DOMContentLoaded", () => {
  const root = document.getElementById("root");

  ReactDOM.render(
  <Root>
    <Clock />
    <Weather />
    <Tabs info={tabsObj} />
    <AutoComplete names={names}/>
  </Root>,
  root);
});