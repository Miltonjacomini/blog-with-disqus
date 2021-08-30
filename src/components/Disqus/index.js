import React, { Component } from 'react';
import { DiscussionEmbed } from 'disqus-react';

export default class Disqus extends Component {

    constructor(props) {
        super(props);
    }

    render() {

        console.log("ARTICLE:");
        console.log(this.props.article);

        return (
            <div class="disqus-comments">
                <DiscussionEmbed 
                    shortname={this.article.shortname}
                    config={
                        {
                            url: this.props.article.url,
                            identifier: this.props.article.id,
                            title: this.props.article.title,
                            language: "pt_BR"
                        }
                    }
                />
            </div>
        )
    }
}