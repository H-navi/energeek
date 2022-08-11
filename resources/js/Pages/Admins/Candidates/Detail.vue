<template>
  <div>
    <admin-layout>
      <section class="content">
        <div class="container-fluid">
          <div class="modal-body overflow-hidden">
            <div class="col-xl-12 col-lg-12 col-md-12 col-12 mb-3">
              <a
                class="btn btn-info text-uppercase mb-5"
                style="letter-spacing: 0.1em"
                v-bind:href="route('admin.candidates.index')"
              >
                Kembali
              </a>
              <table class="table table-bordered table-responsive">
                <tr>
                  <td style="background-color: #42a9bc9c" colspan="4">
                    Detail Lamaran
                  </td>
                </tr>
                <tr>
                  <td width="30%">Nama</td>
                  <td width="3%">:</td>
                  <td>{{ model.name }}</td>
                </tr>
                <tr>
                  <td>Jabatan</td>
                  <td>:</td>
                  <td>{{ model.jobs.name }}</td>
                </tr>
                <tr>
                  <td>Email</td>
                  <td>:</td>
                  <td>{{ model.email }}</td>
                </tr>
                <tr>
                  <td>Telepon</td>
                  <td>:</td>
                  <td>{{ model.phone }}</td>
                </tr>
                <tr>
                  <td>Tahun Lahir</td>
                  <td>:</td>
                  <td>{{ model.year }}</td>
                </tr>
                <tr>
                  <td>Skills</td>
                  <td>:</td>
                  <td>
                    <ul>
                        <li v-for="(skill, index) in skillsets" :key="index">
                        {{ skill.skills.name }}
                        </li>
                    </ul>
                  </td>
                </tr>
              </table>
            </div>
          </div>
        </div>
      </section>
    </admin-layout>
  </div>
</template>

<script>
import AdminLayout from "@/Layouts/AdminLayout";
export default {
  props: ["model", "skillsets"],

  components: {
    AdminLayout,
  },
  data() {
    return {
      editedIndex: -1,
      editMode: false,
      form: this.$inertia.form({
        id: "",
      }),
      value: [],
    };
  },

  methods: {},
};
</script>
