<template>
  <div>
    <div style="height: 20%; overflow: auto; margin-bottom: 10px">
      <h3>Lets Go!</h3>
      <label for="search">Search letgo: </label>
      <input v-model="searchTerm" id="search" type="text" />
      <label for="country">Select Country: </label>
      <select v-model="country" id="country" type="number">
        <option value="tr">Turkey - Ankara</option>
        <option value="es">Spain - Madrid</option>
        <option value="nr">Norway - Oslo</option>
      </select>

      <button @click="handleFetchData()">Search</button>
    </div>
    <Map :productList="productList" :center="countriesLatLong[country]" />
  </div>
</template>


<script>
import Map from "../components/Map.vue";

const countries = {
  tr: "country_code=TR&latitude=39.94&longitude=32.86&locale=tr_TR",
  es: "country_code=ES&latitude=40.4&longitude=-3.68333333333&locale=es_ES",
  nr: "country_code=NO&latitude=59.9166666667&longitude=10.75&locale=nb_NO",
};

export default {
  name: "HomeLetgo",
  components: {
    Map,
  },
  data() {
    return {
      categories: 1,
      productList: [],
      searchTerm: "",
      country: "es",
      countriesLatLong: {
        tr: [39.94, 32.86],
        es: [40.416775, -3.70379],
        nr: [59.9166666667, 10.75],
      },
    };
  },
  async created() {
    this.handleFetchData();
  },
  watch: {
    country() {
      this.handleFetchData();
    },
  },
  methods: {
    async handleFetchData() {
      const response = await fetch(
        `https://searchproducts.letgo.com/api/products?search_term=${
          this.searchTerm
        }&page_size=36&page=1&${countries[this.country]}`
      );
      const data = await response.json();
      this.productList = data;
    },
  },
};
</script>