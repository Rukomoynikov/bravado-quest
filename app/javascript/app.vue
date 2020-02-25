<template>
  <div>
    <router-view/>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
@import 'utilities/variables.css';
@import 'utilities/animations.css';

html, body {
  margin: 0;
  padding: 0;
  height: 100vh;
}

*, :after, :before {
  box-sizing: border-box;
}

body {
  background: var(--background-color-grey);
  font-family: Roboto,sans-serif;
}
</style>
