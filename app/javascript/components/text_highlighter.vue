<script>
export default {
  name: 'TextHighlighter',
  props: {
    highlightText: {
      type: String,
      required: true
    }
  },
  methods: {
    isHighlightedTextExist() {
      if (this.highlightText == '') {
        return false
      }

      const searchingString = new RegExp(this.highlightText, 'gi')
      return this.$slots.default[0].text.match(searchingString)
    },
    cssClass(word) {
      const searchingString = new RegExp(this.highlightText, 'gi')

      return word.match(searchingString)
        ? 'highlightedText'
        : null
    }
  },
  render(createElement, context) {
    if (this.isHighlightedTextExist()) {
      const wordParts = this.$slots.default[0].text.split(new RegExp(`(${this.highlightText})+`, 'gi'))

      return createElement('span',
        wordParts.map((word) => {
          return createElement('span', { class: this.cssClass(word) }, word)
        })
      )
    }

    return createElement('span', this.$slots.default[0].text)
  }
}
</script>

<style>
@import '../utilities/variables.css';

.highlightedText {
  background: var(--background-highlighted-text);
}
</style>
