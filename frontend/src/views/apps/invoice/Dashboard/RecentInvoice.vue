<script setup lang="ts">
import { shallowRef } from 'vue';
import { MoreOutlined } from '@ant-design/icons-vue';
import CardHeader from '@/components/shared/CardHeader.vue';

import Avatar1 from '@/assets/images/users/avatar-5.png';
import Avatar2 from '@/assets/images/users/avatar-6.png';
import Avatar3 from '@/assets/images/users/avatar-7.png';
import Avatar4 from '@/assets/images/users/avatar-8.png';
import Avatar5 from '@/assets/images/users/avatar-9.png';

const Recentdata = shallowRef([
  {
    avatar: Avatar1,
    name: 'David Jones',
    id: '#790841',
    time: '5 min ago',
    price: '$329.20'
  },
  {
    avatar: Avatar2,
    name: 'Jenny Jones',
    id: '#790841',
    time: '1 day ago',
    price: '$182.89'
  },
  {
    avatar: Avatar3,
    name: 'Harry Ben',
    id: '#790841',
    time: '5 min ago',
    price: '$274.00'
  },
  {
    avatar: Avatar4,
    name: 'Jenifer Vintage',
    id: '#790841',
    time: '3 week ago',
    price: '$182.89'
  },
  {
    avatar: Avatar5,
    name: 'Stebin Ben',
    id: '#790841',
    time: '1 month ago',
    price: '$324.00'
  }
]);
</script>
<template>
  <CardHeader title="Recent Invoice" class="overflow-hidden">
    <template v-slot:header>
      <v-btn variant="text" color="secondary" icon rounded size="small">
        <MoreOutlined :style="{ fontSize: '18px' }" />
      </v-btn>
    </template>
    <v-list lines="two" class="py-3" aria-label="member list" aria-busy="true">
      <v-list-item v-for="(item, i) in Recentdata" :key="i" rounded="sm" class="no-spacer">
        <template v-slot:prepend>
          <v-avatar size="40" class="me-3 py-2">
            <img :src="item.avatar" width="40" alt="Julia" />
          </v-avatar>
        </template>
        <div class="d-inline-flex align-center justify-space-between w-100">
          <div>
            <h6 class="text-subtitle-1 mb-0">
              {{ item.name }}-
              <span class="ms-1 text-h6 text-lightText">{{ item.id }}</span>
            </h6>
            <p class="text-h6 text-primary mb-0">{{ item.price }}</p>
          </div>
          <span class="text-caption text-lightText">{{ item.time }}</span>
        </div>
      </v-list-item>
    </v-list>
    <v-card-item class="pt-0">
      <v-btn variant="outlined" color="secondary" block>View all</v-btn>
    </v-card-item>
  </CardHeader>
</template>
