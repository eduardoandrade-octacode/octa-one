<script setup lang="ts">
import { ref } from 'vue';
// common components
import BaseBreadcrumb from '@/components/shared/BaseBreadcrumb.vue';

// icons
import { FileTextOutlined, FileDoneOutlined, BookOutlined } from '@ant-design/icons-vue';

import DetailsTab from './DetailsTab.vue';
import InvoiceTab from './InvoiceTab.vue';
import StatusTab from './StatusTab.vue';

// theme breadcrumb
const page = ref({ title: 'Order Details' });
const breadcrumbs = ref([
  {
    title: 'Customer',
    disabled: false,
    href: '#'
  },
  {
    title: 'Order Details',
    disabled: true,
    href: '#'
  }
]);

const tab2 = ref(null);
</script>

<template>
  <BaseBreadcrumb :title="page.title" :breadcrumbs="breadcrumbs"></BaseBreadcrumb>
  <v-row>
    <v-col cols="12">
      <!-- customer detail table -->
      <v-tabs v-model="tab2" color="primary">
        <v-tab value="11"> <FileTextOutlined :style="{ fontSize: '16px' }" class="v-icon--start" /> Details </v-tab>
        <v-tab value="22"> <FileDoneOutlined :style="{ fontSize: '16px' }" class="v-icon--start" /> Invoice </v-tab>
        <v-tab value="33"> <BookOutlined :style="{ fontSize: '16px' }" class="v-icon--start" /> Status </v-tab>
      </v-tabs>
      <v-divider class="mb-6"></v-divider>
      <v-card-text class="px-0 py-0">
        <v-tabs-window v-model="tab2">
          <v-tabs-window-item value="11">
            <!-- Details tab -->
            <DetailsTab />
          </v-tabs-window-item>

          <v-tabs-window-item value="22">
            <InvoiceTab />
          </v-tabs-window-item>

          <v-tabs-window-item value="33">
            <StatusTab />
          </v-tabs-window-item>
        </v-tabs-window>
      </v-card-text>
    </v-col>
  </v-row>
</template>
