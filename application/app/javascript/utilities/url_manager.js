export class UrlManager {
  static updateUrl(searchQuery) {
    window.history.pushState(
      {},
      `Search: ${searchQuery}`,
      `/search/${searchQuery}/`
    )
  }

  static fetchSearchQuery() {
    const parsedURL = window.location.href.match(/search\/(\w+)/)

    if (parsedURL) {
      return parsedURL[1]
    }

    return null
  }
}
