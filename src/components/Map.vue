<template>
  <l-map style="height: 88vh" :zoom="zoom" :center="center">
    <l-tile-layer :url="url" :attribution="attribution" />
    <l-marker
      :key="product.id"
      v-for="product in productList"
      :lat-lng="[product.geo.lat, product.geo.lng]"
    >
      <l-icon :icon-anchor="dynamicAnchor">
        <div class="price">
          <span> {{ product.price }} {{ product.currency }} </span>
        </div>
      </l-icon>
      <l-popup style="width: 300px" achor>
        <strong style="word-break: break-all; display: flex">
          {{ product.name }}
          <span style="margin-left: auto; color: red">
            {{ product.price }} {{ product.currency }}
          </span>
        </strong>
        <a
          target="_blank"
          :href="
            'https://www.letgo.com/es-es/i/' +
            product.name.replaceAll(' ', '-') +
            '_' +
            product.id
          "
          style="cursor: pointer"
        >
          <img
            :width="dynamicSize[0] * 8.3"
            :height="dynamicSize[1] * 4"
            :src="product.media_thumb.url"
          />
        </a>
        <br />
        <span
          style="
            word-break: break-all;
            max-height: 150px;
            min-height: 50px;
            overflow-y: scroll;
            display: flex;
          "
        >
          {{ product.description }}
        </span>
      </l-popup>
    </l-marker>
    <l-control position="bottomleft">
      <span> Mustafa ERK </span>
    </l-control>
  </l-map>
</template>

<script>
import {
  LMap,
  LTileLayer,
  LMarker,
  LIcon,
  LControl,
  LPopup,
} from "vue2-leaflet";

export default {
  components: {
    LMap,
    LTileLayer,
    LMarker,
    LIcon,
    LPopup,
    LControl,
  },
  props: ["productList", "center"],
  data() {
    return {
      url: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
      zoom: 10,
      iconSize: 36,
      attribution:
        '&copy; <a target="_blank" href="https://www.linkedin.com/in/mustafa-erk-548a32126/">Mustafa ERK</a> contributors',
    };
  },
  computed: {
    dynamicSize() {
      return [this.iconSize, this.iconSize * 1.15];
    },
    dynamicAnchor() {
      return [this.iconSize / 2, this.iconSize * 1.15];
    },
  },
};
</script>


<style >
.price {
  width: 100px;
  background: green;
  font-size: 14px;
  font-weight: 600;
  color: white;
  text-align: center;
  border-radius: 25px;
}
.price:hover {
  background-color: #397bba; /* Green */
  color: white;
}

.leaflet-interactive {
  margin-left: -45px !important;
  margin-top: -10px !important;
}
</style>