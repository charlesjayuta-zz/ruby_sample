module.exports = {
    "moduleDirectories": [
        "node_modules",
        "app/javascript"
    ],
    "moduleFileExtensions": [
        "js",
        "json",
        "vue"
    ],
    "transform": {
        "^.+\\.js$": "../../node_modules/babel-jest",
        ".*\\.(vue)$": "../../node_modules/vue-jest"
    },
    mapCoverage: true
};