<template>
  <form class='searchForm' @submit.prevent='onSearch'>
    <img
      :src="require('images/icons/search_icon.svg')"
      class='searchForm__icon' />
    <input
      :value='value'
      @input='onInput'
      type='text' class='searchForm__input'>
  </form>
</template>

<script>
export default {
  name: "SearchForm",
  data() {
    return {
      searchTimer: null
    }
  },
  props: {
    value: {
      type: String
    }
  },
  methods: {
    onSearch () {
      this.$emit('onSearch', this.searchQuery)
    },
    onInput (event) {
      if (this.searchTimer) {
        clearTimeout(this.searchTimer)
      }

      this.searchTimer = setTimeout(this.onSearch.bind(this), 300)
      this.$emit('input', event.target.value)
    }
  }
}
</script>

<style scoped>
@import '../utilities/variables.css';

.searchForm {
  position: relative;
}

.searchForm__input {
  height: 48px;
  display: block;
  background: var(--background-search-input);
  border-radius: 2px;
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.24), 0px 0px 2px rgba(0, 0, 0, 0.12);

  font-size: 24px;
  line-height: 28px;
  color: rgba(0, 0, 0, 0.75);
  padding-left: 50px;
  width: 100%;
}

.searchForm__icon {
  position: absolute;
  top: calc(50% - 9px);
  left: 21px;
}
</style>
