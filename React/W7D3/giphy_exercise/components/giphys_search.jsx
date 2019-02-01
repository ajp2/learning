import React from 'react';

import GiphysIndex from './giphys_index';

class GiphysSearch extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      searchTerm: "",
      giphys: ""
    };

    this.handleChange = this.handleChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleChange(event) {
    this.setState({ searchTerm: event.target.value });
  }

  handleSubmit(event) {
    event.preventDefault();
    this.props.fetchSearchGiphys(this.state.searchTerm)
      .then(res => this.setState({ giphys: res.giphys }));
  }

  render() {
    return (
      <div>
        <form action="#" onSubmit={this.handleSubmit}>
          <input type="text" value={this.state.searchTerm} onChange={this.handleChange} />
          <button>Submit</button>
        </form>

        {this.state.giphys ? <GiphysIndex giphys={this.state.giphys} /> : false}
      </div>
    );
  }
}

export default GiphysSearch;