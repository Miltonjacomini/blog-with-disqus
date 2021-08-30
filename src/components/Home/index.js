import Disqus from "../Disqus";
import imgPost from "../../utils/img/img-post-1.webp";

export default function Home() {

    var article = {
        title: "Página 1",
        url: "https://mosi-disqus.herokuapp.com",
        identifier: "homepage",
        shortname: "q-a-poc"
    }

    return (
        <div className="post-box">
            <img className="post-img" src={imgPost} alt="Imagem do post"/>

            <section className="post-content">
                <h1>Titulo do primeiro post</h1>
                <p>

Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas in neque rhoncus, pretium dolor sed, maximus augue. Curabitur convallis ligula massa. In imperdiet dolor sit amet varius dapibus. Cras ante nunc, blandit vitae sollicitudin at, vehicula molestie magna. Pellentesque hendrerit iaculis convallis. In accumsan elementum risus. Cras eu dui eu massa pulvinar sollicitudin. Nulla facilisi. Donec vitae ligula venenatis, pharetra magna ut, feugiat urna. Vestibulum urna tortor, sagittis nec auctor ac, tincidunt ac tellus. Aliquam erat volutpat. Pellentesque congue nisl ipsum, quis posuere arcu convallis vel. Aenean ex justo, lacinia vitae vulputate mollis, volutpat vel neque.

Aliquam erat volutpat. Maecenas aliquam, libero quis rhoncus pretium, nunc ante consequat massa, et dignissim ante augue non metus. Etiam hendrerit a enim vitae laoreet. Nam pharetra lacus id ante aliquam, bibendum porttitor ex cursus. Integer quis fermentum quam. Aliquam erat volutpat. Mauris faucibus eu est nec rutrum. Suspendisse potenti. Curabitur convallis imperdiet ex in venenatis. Suspendisse suscipit tortor auctor turpis condimentum hendrerit. Vestibulum finibus, enim vitae volutpat aliquam, arcu mauris euismod felis, nec ultrices dui risus sed lorem. Ut congue venenatis diam sed hendrerit. </p>
            </section>

            <Disqus article={article} />
        </div>
    );
}