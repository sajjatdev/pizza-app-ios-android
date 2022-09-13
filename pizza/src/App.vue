<template>
  <div class="container">
    <div class="row">
      <div class="col-4">
        <div class="card">
          <div class="card-body">
            <div>{{ collection }}</div>
            <h3 class="card-title">Title</h3>
            <p class="card-text">Text</p>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "App",
  computed: {
    collection() {
      return axios.get("http://127.0.0.1:8000/collection/", {
        headers: {
          "Content-Type": "application/json",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Methods": "GET,PUT,POST,DELETE,PATCH,OPTIONS",
        },
      });
    },
  },
};
</script>
