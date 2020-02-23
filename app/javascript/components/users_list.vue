<template>
  <div>
    <div class='userCard' v-for='user in users'>
      <div class='userCard__avatar'>
        <img :src="require('images/avatars/image.png')" />
      </div>
      <div class='userCard__generalInfo'>
        <div class='userCard__topRow'>
          <div class='userCard__fullName'>
            <TextHighlihter :highlightText='highlightText'>
              {{user.first_name}} {{user.second_name}}
            </TextHighlihter>
          </div>
          <div class='userCard__email'>
            <TextHighlihter :highlightText='highlightText'>
              {{user.email }}
            </TextHighlihter>
          </div>
        </div>
        <div class='userCard__position'>
          <TextHighlihter :highlightText='highlightText'>
            {{user.position}}
          </TextHighlihter>
        </div>
        <div class='userCard__address'>
          <TextHighlihter :highlightText='highlightText'>
            {{user.address}}
          </TextHighlihter>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import TextHighlihter from '../components/text_highlighter'

export default {
  name: 'UsersList',
  components: {
    TextHighlihter
  },
  props: {
    users: {
      type: Array,
      required: true
    },
    highlightText: {
      type: String,
      required: true
    }
  }
}
</script>

<style scoped>
@import '../utilities/variables.css';

.userCard {
  background: var(--background-user-card);
  box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.24), 0px 0px 2px rgba(0, 0, 0, 0.12);
  border-radius: 3px;
  border: 1px solid transparent;
  display: flex;
  margin-top: 21px;
}

.userCard__topRow {
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
}

.userCard__avatar {
  background: rgba(0, 0, 0, 0.25);
  width: 134px;
  height: 136px;
}

.userCard:hover {
  border: 1px solid var(--border-user-card);
}

.userCard__generalInfo {
  padding: 10px 10px 0 27px;
  width: 100%;
}

.userCard__fullName {
  font-size: 24px;
  line-height: 32px;
  color: rgba(0, 0, 0, 0.87);
}

.userCard__position {
  font-weight: bold;
  font-size: 14px;
  line-height: 20px;
  color: rgba(0, 0, 0, 0.543846);
}

.userCard__address {
  font-size: 14px;
  line-height: 20px;
  color: rgba(0, 0, 0, 0.543846);
}

.userCard__email {
  font-size: 14px;
  line-height: 16px;
  color: rgba(0, 0, 0, 0.54);
}
</style>
