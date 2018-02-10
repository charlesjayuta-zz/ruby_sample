<template>
    <b-row class="mt-5">
        <b-col>
            <b-table hover
                     :items="games"
                     :fields="fields"
                     :sort-by.sync="sortBy"
                     :sort-desc.sync="sortDesc">
                <template slot="name" slot-scope="row">
                    <div v-b-modal.gameDialog
                         @click="updateModal(row.item.id)">
                        {{ row.item.name }}
                    </div>
                </template>
            </b-table>
        </b-col>
        <modal ref="gameDialog"></modal>
    </b-row>
</template>

<script>
    import axios from 'axios'
    import Modal from './modal.vue'

    export default {
        data() {
            return {
                fields: [
                    {
                        key: 'name',
                        tdClass: 'link'
                    },
                    {
                        key: 'year',
                        sortable: true
                    },
                    {
                        key: 'manufacturer',
                        label: 'Publisher'
                    }
                ],
                sortBy: 'year',
                sortDesc: false,
                games: []
            }
        },
        created() {
            this.fetch()
        },
        methods: {
            fetch: function() {
                var thiz = this;
                // // AJAX call for active games
                axios.get('/games')
                    .then(function(response) {
                        thiz.games = response.data
                    })
                    .catch(function(error) {
                        console.log(error)
                    });
            },
            updateModal: function(id) {
                this.$refs.gameDialog.fetch(id)
            }
        },
        components: {
            'modal': Modal
        }
    }
</script>

<style scoped>

</style>