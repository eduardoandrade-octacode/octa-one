<script setup lang="ts">
import { ref, computed } from 'vue';
import moment from 'moment';
// common components
import BaseBreadcrumb from '@/components/shared/BaseBreadcrumb.vue';

// icons
import { CalendarOutlined, EditOutlined, PlusOutlined, SearchOutlined, DeleteOutlined } from '@ant-design/icons-vue';

import Flag1 from '@/assets/images/flags/1.jpg';
import Flag2 from '@/assets/images/flags/2.jpg';
import Flag3 from '@/assets/images/flags/3.jpg';
import Flag4 from '@/assets/images/flags/4.jpg';
import Flag5 from '@/assets/images/flags/5.jpg';

// theme breadcrumb
const page = ref({ title: 'New Invoice' });
const breadcrumbs = ref([
  {
    title: 'Invoice',
    disabled: false,
    href: '#'
  },
  {
    title: 'Create Invoice',
    disabled: true,
    href: '#'
  }
]);

const dialog = ref(false);
const dialog1 = ref(false);

const items = ref(['Paid', 'Unpaid', 'Cancelled']);

// datepicker
const selectedDate = ref(null);
const selectedDate1 = ref(null);
const computedDateFormattedMomentjs = computed(() => {
  return selectedDate.value ? moment(selectedDate.value).format('MMMM Do YYYY') : '';
});
const computedDateFormattedMomentjs1 = computed(() => {
  return selectedDate1.value ? moment(selectedDate1.value).format('MMMM Do YYYY') : '';
});

type ListType = {
  title: string;
  address: string;
  contact: string;
  mail: string;
};

const SearchList = ref<ListType[]>([
  {
    title: 'Ian Carpenter',
    address: '1754 Ureate, RhodSA5 5BO',
    contact: '+91 1234567890',
    mail: 'iacrpt65@gmail.com'
  },
  {
    title: 'Belle J. Richter',
    address: '1300 Mine RoadQuemado, NM 87829',
    contact: '305-829-7809',
    mail: 'belljrc23@gmail.com'
  },
  {
    title: 'Ritika Yohannan',
    address: '3488 Arbutus DriveMiami, FL',
    contact: '+91 1234567890',
    mail: 'rtyhn65@gmail.com'
  },
  {
    title: 'Jesse G. Hassen',
    address: '3488 Arbutus DriveMiami, FL 33012',
    contact: '+91 1234567890',
    mail: 'jessghs78@gmail.com'
  },
  {
    title: 'Christopher P. Iacovelli',
    address: '4388 House DriveWesrville, OH',
    contact: '+91 1234567890',
    mail: 'crpthl643@gmail.com'
  },
  {
    title: 'Thomas D. Johnson',
    address: '4388 House DriveWestville, OH',
    contact: '+91 1234567890',
    mail: 'thomshj56@gmail.com'
  }
]);

const selectedItem = ref<ListType[]>([{ title: '', address: '', contact: '', mail: '' }]);

let TitleContent = 'Belle J. Richter';
let AddressContent = '1300 Cooks Mine, NM 87829';
let ContactContent = '305-829-7809';
let MailContent = 'belljrc23@gmail.com';

let TitleContent1 = '';
let AddressContent1 = '';
let ContactContent1 = '';
let MailContent1 = '';

function selectItem(item: ListType) {
  // update content
  TitleContent = item.title;
  AddressContent = item.address;
  ContactContent = item.contact;
  MailContent = item.mail;

  TitleContent1 = item.title;
  AddressContent1 = item.address;
  ContactContent1 = item.contact;
  MailContent1 = item.mail;
}

function selectItem1(item: ListType) {
  // update content
  TitleContent1 = item.title;
  AddressContent1 = item.address;
  ContactContent1 = item.contact;
  MailContent1 = item.mail;
}

// table data
type TableType = {
  number: number;
  name: string;
  description: string;
  qty: number;
  price: string;
};

const tableData = ref<TableType[]>([
  {
    number: 1,
    name: 'Item name',
    description: 'Description',
    qty: 1,
    price: '1.00'
  }
]);

function tableItem() {
  const newItem: TableType = {
    number: tableData.value.length + 1,
    name: 'Item name',
    description: 'Description',
    qty: 1,
    price: '1.00'
  };

  tableData.value.push(newItem);
}

function deleteRow(index: number) {
  tableData.value.splice(index, 1);
}

const country = ref([
  { name: 'Anguilla', avatar: Flag1 },
  { name: 'Brazil', avatar: Flag2 },
  { name: 'Germany', avatar: Flag3 },
  { name: 'United Kingdom', avatar: Flag4 },
  { name: 'United States', avatar: Flag5 }
]);

const countryflag = ref(['United States']);
const isUpdating = ref(false);
</script>
<template>
  <BaseBreadcrumb :title="page.title" :breadcrumbs="breadcrumbs"></BaseBreadcrumb>
  <v-row>
    <v-col cols="12" md="12">
      <v-card variant="outlined" class="bg-surface">
        <v-card-item>
          <v-row>
            <v-col cols="12" md="3">
              <v-label class="mb-2">Invoice Id</v-label>
              <v-text-field
                single-line
                variant="outlined"
                aria-label="id"
                hide-details
                type="number"
                color="primary"
                placeholder="1701150654836"
              ></v-text-field>
            </v-col>
            <v-col cols="12" md="3">
              <v-label class="mb-2">Status</v-label>
              <v-autocomplete
                aria-label="autocomplete"
                model-value="Unpaid"
                :items="items"
                color="primary"
                variant="outlined"
                hide-details
                single-line
                density="default"
              ></v-autocomplete>
            </v-col>
            <v-col cols="12" md="3">
              <v-label class="mb-2">Date</v-label>
              <v-menu :close-on-content-click="false">
                <template v-slot:activator="{ props }">
                  <v-text-field
                    single-line
                    hide-details
                    variant="outlined"
                    v-bind="props"
                    v-model="computedDateFormattedMomentjs"
                    label="Selected Date"
                    readonly
                    color="primary"
                  >
                    <template v-slot:append-inner>
                      <CalendarOutlined />
                    </template>
                  </v-text-field>
                </template>
                <v-date-picker v-model="selectedDate" hide-header color="primary"></v-date-picker>
              </v-menu>
            </v-col>
            <v-col cols="12" md="3">
              <v-label class="mb-2">Due Date</v-label>
              <v-menu :close-on-content-click="false">
                <template v-slot:activator="{ props }">
                  <v-text-field
                    single-line
                    variant="outlined"
                    hide-details
                    v-bind="props"
                    v-model="computedDateFormattedMomentjs1"
                    label="Selected Date"
                    readonly
                    color="primary"
                  >
                    <template v-slot:append-inner>
                      <CalendarOutlined />
                    </template>
                  </v-text-field>
                </template>
                <v-date-picker v-model="selectedDate1" hide-header color="primary"></v-date-picker>
              </v-menu>
            </v-col>
            <v-col cols="12" md="6">
              <v-card variant="outlined">
                <v-card-item>
                  <div class="d-flex justify-space-between">
                    <div>
                      <h5 class="text-h5 mb-4">From:</h5>
                      <h6 class="text-subtitle-1 mb-0" v-if="selectedItem">{{ TitleContent }}</h6>
                      <p class="text-h6 text-lightText mb-0" v-if="selectedItem">{{ AddressContent }}</p>
                      <p class="text-h6 text-lightText mb-0" v-if="selectedItem">{{ ContactContent }}</p>
                      <p class="text-h6 text-lightText mb-0" v-if="selectedItem">{{ MailContent }}</p>
                    </div>
                    <v-btn color="secondary" size="small" variant="outlined" @click="dialog = true">
                      <template v-slot:prepend>
                        <EditOutlined />
                      </template>
                      Change
                    </v-btn>
                    <v-dialog v-model="dialog" width="510">
                      <v-card>
                        <v-card-title class="py-4">
                          <div class="d-flex justify-space-between align-center">
                            <h5 class="text-h5 mb-0">Select Address</h5>
                            <v-btn variant="text" color="primary">
                              <template v-slot:prepend>
                                <PlusOutlined />
                              </template>
                              Add New
                            </v-btn>
                          </div>
                        </v-card-title>
                        <v-divider></v-divider>
                        <v-card-text>
                          <perfect-scrollbar style="height: 360px" :options="{ suppressScrollX: true }">
                            <v-text-field type="text" variant="outlined" persistent-placeholder placeholder="Search" hide-details>
                              <template v-slot:prepend-inner>
                                <SearchOutlined class="text-lightText" />
                              </template>
                            </v-text-field>
                            <v-list class="py-0 mt-3">
                              <v-list-item
                                class="pa-0 mb-3 rounded-md"
                                v-for="(item, i) in SearchList"
                                :value="item.title"
                                :key="i"
                                @click="selectItem(item)"
                              >
                                <v-card variant="outlined" class="overflow-hidden">
                                  <v-card-item class="pa-3">
                                    <h6 class="text-subtitle-1 mb-0">{{ item.title }}</h6>
                                    <div class="d-flex ga-1 flex-wrap">
                                      <p class="text-caption text-lightText mb-0">{{ item.address }}</p>
                                      <p class="text-caption text-lightText mb-0">{{ item.contact }}</p>
                                      <p class="text-caption text-lightText mb-0">{{ item.mail }}</p>
                                    </div>
                                  </v-card-item>
                                </v-card>
                              </v-list-item>
                            </v-list>
                          </perfect-scrollbar>
                        </v-card-text>
                        <v-divider></v-divider>
                        <v-card-actions class="ms-auto">
                          <v-btn color="error" variant="text" @click="dialog = false">Cancel</v-btn>
                          <v-btn color="primary" variant="flat" @click="dialog = false">Add</v-btn>
                        </v-card-actions>
                      </v-card>
                    </v-dialog>
                  </div>
                </v-card-item>
              </v-card>
            </v-col>
            <v-col cols="12" md="6">
              <v-card variant="outlined" class="h-100">
                <v-card-item>
                  <div class="d-flex justify-space-between">
                    <div>
                      <h5 class="text-h5 mb-4">To:</h5>
                      <h6 class="text-subtitle-1 mb-0" v-if="selectedItem">{{ TitleContent1 }}</h6>
                      <p class="text-h6 text-lightText mb-0" v-if="selectedItem">{{ AddressContent1 }}</p>
                      <p class="text-h6 text-lightText mb-0" v-if="selectedItem">{{ ContactContent1 }}</p>
                      <p class="text-h6 text-lightText mb-0" v-if="selectedItem">{{ MailContent1 }}</p>
                    </div>
                    <v-btn color="secondary" size="small" variant="outlined" @click="dialog1 = true">
                      <template v-slot:prepend>
                        <PlusOutlined />
                      </template>
                      Add
                    </v-btn>
                    <v-dialog v-model="dialog1" width="510">
                      <v-card>
                        <v-card-title class="py-4">
                          <div class="d-flex justify-space-between align-center">
                            <h5 class="text-h5 mb-0">Select Address</h5>
                            <v-btn variant="text" color="primary">
                              <template v-slot:prepend>
                                <PlusOutlined />
                              </template>
                              Add New
                            </v-btn>
                          </div>
                        </v-card-title>
                        <v-divider></v-divider>
                        <v-card-text>
                          <perfect-scrollbar style="height: 360px" :options="{ suppressScrollX: true }">
                            <v-text-field type="text" variant="outlined" persistent-placeholder placeholder="Search" hide-details>
                              <template v-slot:prepend-inner>
                                <SearchOutlined class="text-lightText" />
                              </template>
                            </v-text-field>
                            <v-list class="py-0 mt-3">
                              <v-list-item
                                class="pa-0 mb-3 rounded-md"
                                v-for="(item, i) in SearchList"
                                :value="item.title"
                                :key="i"
                                @click="selectItem1(item)"
                              >
                                <v-card variant="outlined" class="overflow-hidden">
                                  <v-card-item class="pa-3">
                                    <h6 class="text-subtitle-1 mb-0">{{ item.title }}</h6>
                                    <div class="d-flex ga-1 flex-wrap">
                                      <p class="text-caption text-lightText mb-0">{{ item.address }}</p>
                                      <p class="text-caption text-lightText mb-0">{{ item.contact }}</p>
                                      <p class="text-caption text-lightText mb-0">{{ item.mail }}</p>
                                    </div>
                                  </v-card-item>
                                </v-card>
                              </v-list-item>
                            </v-list>
                          </perfect-scrollbar>
                        </v-card-text>
                        <v-divider></v-divider>
                        <v-card-actions class="ms-auto">
                          <v-btn color="error" variant="text" @click="dialog1 = false">Cancel</v-btn>
                          <v-btn color="primary" variant="flat" @click="dialog1 = false">Add</v-btn>
                        </v-card-actions>
                      </v-card>
                    </v-dialog>
                  </div>
                </v-card-item>
              </v-card>
            </v-col>
            <v-col cols="12">
              <h5 class="text-h5">Detail</h5>
              <v-table class="bordered-table" hover>
                <thead class="bg-containerBg">
                  <tr>
                    <th class="text-start text-uppercase text-caption font-weight-bold" style="width: 50px">#</th>
                    <th class="text-start text-uppercase text-caption font-weight-bold" style="min-width: 270px">Name</th>
                    <th class="text-start text-uppercase text-caption font-weight-bold" style="min-width: 270px">Description</th>
                    <th class="text-start text-uppercase text-caption font-weight-bold" style="width: 270px; min-width: 100px">Qty</th>
                    <th class="text-start text-uppercase text-caption font-weight-bold" style="width: 270px; min-width: 100px">Price</th>
                    <th class="text-end text-uppercase text-caption font-weight-bold" style="width: 97px">Amount</th>
                    <th class="text-center text-uppercase text-caption font-weight-bold" style="width: 124px">Action</th>
                  </tr>
                </thead>
                <tbody>
                  <tr class="text-lighttext" v-for="(item, index) in tableData" :key="index">
                    <td class="text-subtitle-1 font-weight-regular py-3">{{ item.number }}</td>
                    <td class="text-subtitle-1 font-weight-regular py-3">
                      <v-text-field variant="outlined" single-line hide-details :placeholder="item.name"></v-text-field>
                    </td>
                    <td class="text-subtitle-1 font-weight-regular py-3">
                      <v-text-field variant="outlined" single-line hide-details :placeholder="item.description"></v-text-field>
                    </td>
                    <td class="text-subtitle-1 font-weight-regular py-3">
                      <v-text-field
                        variant="outlined"
                        aria-label="quantity"
                        type="number"
                        single-line
                        hide-details
                        :model-value="item.qty"
                      ></v-text-field>
                    </td>
                    <td class="text-subtitle-1 font-weight-regular py-3">
                      <v-text-field
                        variant="outlined"
                        aria-label="price"
                        type="number"
                        single-line
                        hide-details
                        :model-value="item.price"
                      ></v-text-field>
                    </td>
                    <td class="text-subtitle-1 font-weight-regular py-3 text-end">${{ item.price }}</td>
                    <td class="text-subtitle-1 font-weight-regular py-3 text-center">
                      <v-btn color="error" icon rounded variant="text" @click="deleteRow(index)">
                        <DeleteOutlined />
                      </v-btn>
                    </td>
                  </tr>
                </tbody>
              </v-table>
              <v-divider></v-divider>
              <v-row class="mt-2">
                <v-col cols="12" sm="7" md="8">
                  <v-btn color="primary" border="primary dashed thin opacity-100" variant="tonal" @click="tableItem()">
                    <template v-slot:prepend>
                      <PlusOutlined />
                    </template>
                    Add item
                  </v-btn>
                </v-col>
                <v-col cols="12" sm="5" md="4">
                  <v-row>
                    <v-col cols="6">
                      <v-label class="mb-2">Discount(%)</v-label>
                      <v-text-field
                        variant="outlined"
                        aria-label="discount"
                        single-line
                        hide-details
                        type="number"
                        model-value="0"
                      ></v-text-field>
                    </v-col>
                    <v-col cols="6">
                      <v-label class="mb-2">Tax(%)</v-label>
                      <v-text-field
                        variant="outlined"
                        aria-label="tax"
                        single-line
                        hide-details
                        type="number"
                        model-value="0"
                      ></v-text-field>
                    </v-col>
                  </v-row>
                  <v-list density="compact" aria-label="total list" aria-busy="true">
                    <v-list-item class="px-0">
                      <p class="text-h6 text-lightText mb-0">Sub Total:</p>
                      <template v-slot:append>
                        <p class="text-h6 mb-0">$1.00</p>
                      </template>
                    </v-list-item>
                    <v-list-item class="px-0">
                      <p class="text-h6 text-lightText mb-0">Discount:</p>
                      <template v-slot:append>
                        <p class="text-h6 mb-0 text-success">$0.01</p>
                      </template>
                    </v-list-item>
                    <v-list-item class="px-0">
                      <p class="text-h6 text-lightText mb-0">Tax:</p>
                      <template v-slot:append>
                        <p class="text-h6 mb-0">$0.00</p>
                      </template>
                    </v-list-item>
                    <v-list-item class="px-0">
                      <p class="text-subtitle-1 mb-0">Grand Total:</p>
                      <template v-slot:append>
                        <p class="text-subtitle-1 mb-0">$0.99</p>
                      </template>
                    </v-list-item>
                  </v-list>
                </v-col>
              </v-row>
            </v-col>
            <v-col cols="12">
              <v-label class="mb-2">Notes</v-label>
              <v-textarea variant="outlined" single-line hide-details placeholder="Address"></v-textarea>
            </v-col>
            <v-row class="mx-0 mb-0 mt-2 align-end">
              <v-col cols="12" md="5" lg="3">
                <v-label class="mb-2">Set Currency*</v-label>
                <v-autocomplete
                  v-model="countryflag"
                  :disabled="isUpdating"
                  :items="country"
                  variant="outlined"
                  item-title="name"
                  item-value="name"
                  class="remove-details"
                  label="Select"
                  single-line
                  color="primary"
                  clearable
                  aria-label="autocomplete"
                  clear-icon="$close"
                >
                  <template v-slot:item="{ props, item }">
                    <v-list-item v-bind="props" :title="item?.raw?.name">
                      <template v-slot:prepend>
                        <v-avatar size="18" rounded="sm">
                          <img :src="item?.raw?.avatar" width="18" alt="flag" />
                        </v-avatar>
                      </template>
                    </v-list-item>
                  </template>
                </v-autocomplete>
              </v-col>
              <v-col cols="12" md="7" lg="9">
                <div class="text-end">
                  <v-btn color="secondary" variant="tonal" disabled>Preview</v-btn>
                  <v-btn color="secondary" variant="outlined" class="mx-2">Save</v-btn>
                  <v-btn color="primary" variant="flat">Create & Send</v-btn>
                </div>
              </v-col>
            </v-row>
          </v-row>
        </v-card-item>
      </v-card>
    </v-col>
  </v-row>
</template>
