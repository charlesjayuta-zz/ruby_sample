<template>
    <b-modal sz="lg" id="gameDialog" centered :title="game.name">
        <b-row class="">
            <b-col v-if="game.image_url">
                <b-img :src="game.image_url" class="image-row" fluid center />
            </b-col>
            <b-col>
                <blockquote class="blockquote mt-5">
                    <p class="lead mb-0">{{ game.description }}</p>
                    <footer class="blockquote-footer">Published by
                        <cite>{{ game.manufacturer }}</cite> in
                        <cite>{{ game.year }}</cite>
                    </footer>
                </blockquote>
            </b-col>
        </b-row>
        <div slot="modal-footer" class="w-100">
            <b-btn size="sm" class="float-left" variant="primary" @click="like">
                Like <b-badge pill variant="light">{{ game.likes }}</b-badge>
            </b-btn>
        </div>
    </b-modal>
</template>

<script>
    import axios from 'axios'

    export default {
        data: function() {
            return {
                game: {}
            }
        },
        methods: {
            fetch: function(id) {
                var thiz = this;
                // AJAX call for game detail
                axios.get('/games/' + id)
                    .then(function(response) {
                        thiz.game = response.data
                    })
                    .catch(function(error) {
                        console.log(error)
                    });
            },
            like: function() {
                var thiz = this;
                // AJAX post to attempt like, returns updated like count
                axios.post('/games/like', {
                        id: this.game.id
                    })
                    .then(function(response) {
                        thiz.game.likes = response.data
                    })
                    .catch(function(response) {
                        console.log(response)
                    })
            }
        }
    }
</script>

<style scoped>

</style>