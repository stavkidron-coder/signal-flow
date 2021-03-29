import React, { Component } from 'react';
import { connect } from 'react-redux';
import { Button, Col, Container, Jumbotron, Row } from 'reactstrap';
import mapStoreToProps from '../../redux/mapStoreToProps';

class HomePage extends Component {
  render() {
    return (
      <div>
        <Jumbotron>
          <Container>
            <h1>Signal Flow</h1>
            <Row>

              <Col xs="12" md="8">
                <div className="homeJumboDescription">
                  <h6>
                    lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 
                    lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 
                    lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum 
                    lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum lorem ipsum
                  </h6>
                </div>
              </Col>

              <Col md="4" xs="12">
                <Button>New Session</Button>
              </Col>

            </Row>
          </Container>
        </Jumbotron>
      </div>
    );
  }
}

// this allows us to use <App /> in index.js
export default connect(mapStoreToProps)(HomePage);
