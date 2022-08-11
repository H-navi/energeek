<template>
  <div>
    <admin-layout>
      <section class="content">
        <div class="container-fluid">
          <div class="row">
            <div class="col-12">
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Candidates</h3>
                  <div v-if="$page.props.flash.message">
                    <p>{{ $page.props.flash.message }}</p>
                  </div>
                  <div
                    class="card-tools"
                    v-if="
                      $page.props.auth.hasRole.superAdmin ||
                      $page.props.auth.hasRole.admin
                    "
                  >
                    <button
                      type="button"
                      class="btn btn-info text-uppercase"
                      style="letter-spacing: 0.1em"
                      @click="openModal"
                    >
                      Create
                    </button>
                  </div>
                </div>
                <div class="card-body table-responsive p-0">
                  <table class="table table-hover text-nowrap">
                    <thead>
                      <tr>
                        <th class="text-capitalize">Nama</th>
                        <th class="text-capitalize">E-mail</th>
                        <th class="text-capitalize">Telepon</th>
                        <th class="text-capitalize">Tahun Lahir</th>
                        <th class="text-capitalize">Jabatan</th>
                        <th class="text-capitalize">Dibuat Pada</th>
                        <th
                          class="text-capitalize text-right"
                          v-if="
                            $page.props.auth.hasRole.superAdmin ||
                            $page.props.auth.hasRole.admin
                          "
                        >
                          Actions
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr v-for="(candidate, index) in candidates" :key="index">
                        <td class="text-capitalize">{{ candidate.name }}</td>
                        <td>{{ candidate.email }}</td>
                        <td>{{ candidate.phone }}</td>
                        <td>{{ candidate.year }}</td>
                        <td>{{ candidate.jobs.name }}</td>
                        <td>{{ candidate.created_at }}</td>
                        <td
                          class="text-right"
                          v-if="
                            $page.props.auth.hasRole.superAdmin ||
                            $page.props.auth.hasRole.admin
                          "
                        >
                          <a
                            class="btn btn-success text-uppercase"
                            style="letter-spacing: 0.1em"
                            v-bind:href="
                              route('admin.candidates.show', [candidate.id])
                            "
                          >
                            Detail
                          </a>
                          <button
                            class="btn btn-success text-uppercase ml-1"
                            style="letter-spacing: 0.1em"
                            @click="editModal(candidate)"
                          >
                            Edit
                          </button>
                          <button
                            class="btn btn-danger text-uppercase ml-1"
                            style="letter-spacing: 0.1em"
                            @click="deleteCandidate(candidate)"
                          >
                            Delete
                          </button>
                        </td>
                      </tr>
                    </tbody>
                  </table>
                </div>
                <div class="card-footer clearfix">
                  <pagination :links="candidates.links"></pagination>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      <div
        class="modal fade"
        id="modal-lg"
        data-toggle="modal"
        data-backdrop="static"
        data-keyboard="false"
      >
        <div class="modal-dialog modal-lg modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <h4 class="modal-title">{{ formTitle }}</h4>
              <button
                type="button"
                class="close"
                @click="closeModal"
                aria-label="Close"
              >
                <span aria-hidden="true">&times;</span>
              </button>
            </div>
            <div class="modal-body overflow-hidden">
              <div class="card card-primary">
                <form @submit.prevent="checkMode">
                  <div class="card-body">
                    <div class="form-group">
                      <label for="skills" v-if="editMode == false" class="h4"
                        >Jabatan</label
                      >
                      <label for="skills" v-if="editMode == true" class="h4"
                        >Jabatan (leave blank if not edit)</label
                      >
                      <multiselect
                        v-model="form.job"
                        :options="jobOptions"
                        :multiple="false"
                        placeholder="Choose a Job"
                        label="name"
                        track-by="id"
                      ></multiselect>
                    </div>
                    <div
                      class="invalid-feedback"
                      :class="{ 'd-block': form.errors.job }"
                    >
                      {{ form.errors.job }}
                    </div>

                    <div class="form-group">
                      <label for="name" class="h4">Nama</label>
                      <input
                        type="text"
                        class="form-control"
                        placeholder="Nama"
                        v-model="form.name"
                        :class="{ 'is-invalid': form.errors.name }"
                        autofocus="autofocus"
                        autocomplete="off"
                      />
                    </div>
                    <div
                      class="invalid-feedback mb-3"
                      :class="{ 'd-block': form.errors.name }"
                    >
                      {{ form.errors.name }}
                    </div>

                    <div class="form-group">
                      <label for="email" class="h4">E-mail</label>
                      <input
                        type="email"
                        class="form-control"
                        placeholder="E-mail Address"
                        v-model="form.email"
                        :class="{ 'is-invalid': form.errors.email }"
                        autocomplete="off"
                      />
                    </div>
                    <div
                      class="invalid-feedback mb-3"
                      :class="{ 'd-block': form.errors.email }"
                    >
                      {{ form.errors.email }}
                    </div>

                    <div class="form-group">
                      <label for="phone" class="h4">Telepon</label>
                      <input
                        type="text"
                        class="form-control"
                        placeholder="Telepon"
                        v-model="form.phone"
                        :class="{ 'is-invalid': form.errors.phone }"
                        autofocus="autofocus"
                        autocomplete="off"
                      />
                    </div>
                    <div
                      class="invalid-feedback mb-3"
                      :class="{ 'd-block': form.errors.phone }"
                    >
                      {{ form.errors.phone }}
                    </div>

                    <div class="form-group">
                      <label for="year" class="h4">Tahun Lahir</label>
                      <input
                        type="number"
                        class="form-control"
                        placeholder="Tahun Lahir"
                        v-model="form.year"
                        :class="{ 'is-invalid': form.errors.year }"
                        autofocus="autofocus"
                        autocomplete="off"
                      />
                      <!-- <datepicker
                        class="form-control"
                        placeholder="Tahun Lahir"
                        v-model="form.year"
                        :class="{ 'is-invalid': form.errors.year }"
                        :format="format"
                        autofocus="autofocus"
                        autocomplete="off"
                      ></datepicker> -->
                    </div>
                    <div
                      class="invalid-feedback mb-3"
                      :class="{ 'd-block': form.errors.year }"
                    >
                      {{ form.errors.year }}
                    </div>

                    <div class="form-group">
                      <label v-if="editMode == false" for="skills" class="h4"
                        >Skills</label
                      >
                      <label v-if="editMode" for="skills" class="h4"
                        >Skills (leave blank if not edit)
                      </label>
                      <multiselect
                        v-model="form.skills"
                        :options="skillOptions"
                        :multiple="true"
                        placeholder="Choose skills"
                        label="name"
                        track-by="id"
                      ></multiselect>
                    </div>
                    <div
                      class="invalid-feedback"
                      :class="{ 'd-block': form.errors.skills }"
                    >
                      {{ form.errors.skills }}
                    </div>
                  </div>

                  <div class="">
                    <div class="row">
                      <div class="col-12 mb-2">
                        <button
                          type="submit"
                          class="btn btn-block text-uppercase"
                          style="letter-spacing: 0.1em; background-color: #cf5066;"
                          :disabled="
                            !form.name || !form.email || !form.phone || !form.year
                          "
                        >
                          {{ buttonTxt }}
                        </button>
                      </div>
                      <div class="col-12">
                        <button
                          type="button"
                          class="btn btn-block btn-warning text-uppercase"
                          style="letter-spacing: 0.1em"
                          @click="closeModal"
                        >
                          Cancel
                        </button>
                      </div>
                    </div>
                  </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
    </admin-layout>
  </div>
</template>

<script>
import AdminLayout from "@/Layouts/AdminLayout";
import Pagination from "@/Components/Pagination";
import Datepicker from "vue3-datepicker";
export default {
  props: ["skills", "jobs", "candidates", "message"],
  components: {
    AdminLayout,
    Pagination,
    Datepicker,
  },
  data() {
    return {
      editedIndex: -1,
      editMode: false,
      format: "YYYY",
      form: this.$inertia.form({
        id: "",
        job: "",
        name: "",
        email: "",
        phone: "",
        year: "",
        job: [],
        skills: [],
      }),
      jobOptions: this.jobs,
      skillOptions: this.skills,
    };
  },
  computed: {
    formTitle() {
      return this.editedIndex === -1
        ? "Create New Candidate"
        : "Edit Current Candidate";
    },
    buttonTxt() {
      return this.editedIndex === -1 ? "Apply" : "Edit";
    },
    checkMode() {
      return this.editMode === false
        ? this.createCandidate
        : this.editCandidate;
    },
  },
  methods: {
    addTag(newRole) {
      let tag = {
        name: newRole,
      };
      this.jobOptions.push(tag);
      this.skillOptions.push(tag);
      this.form.skills.push(tag);
    },
    editModal(candidate) {
      this.editMode = true;
      $("#modal-lg").modal("show");
      this.editedIndex = this.candidates.indexOf(candidate);
      this.form.name = candidate.name;
      this.form.email = candidate.email;
      this.form.phone = candidate.phone;
      this.form.year = candidate.year;
      this.form.job = candidate.job;
      this.form.id = candidate.id;
      this.form.skills = candidate.skills;
    },
    openModal() {
      this.editedIndex = -1;
      $("#modal-lg").modal("show");
    },
    closeModal() {
      this.form.clearErrors();
      this.editMode = false;
      this.form.reset();
      $("#modal-lg").modal("hide");
    },
    createCandidate() {
      this.form.post(this.route("admin.candidates.store"), {
        preserveScroll: true,
        onSuccess: () => {
          this.closeModal();
          if (this.$page.props.flash.message == "ErrorEmail") {
            Swal.fire({
              icon: "warning",
              title: "Terjadi Kesalahan",
              text: "Email atau telepon yang anda masukkan sudah pernah melamar dijabatan tersebut, silahkan memilih jabatan yang lain.",
            });
          } else if (this.$page.props.flash.message == "ErrorPhone") {
            Swal.fire({
              icon: "warning",
              title: "Terjadi Kesalahan",
              text: "Telepon yang anda masukkan bukan angka.",
            });
          } else {
            Swal.fire({
              icon: "success",
              title: "Berhasil",
              text: "Lamaran Behasil Terkirim.",
            });
          }
        },
      });
    },
    editCandidate() {
      this.form.put(
        this.route("admin.candidates.update", this.form.id, this.form),
        {
          preserveScroll: true,
          onSuccess: () => {
            if (this.$page.props.flash.message == "ErrorEmail") {
              Swal.fire({
                icon: "warning",
                title: "Terjadi Kesalahan",
                text: "Email atau telepon yang anda masukkan sudah pernah melamar dijabatan tersebut, silahkan memilih jabatan yang lain.",
              });
            } else if (this.$page.props.flash.message == "ErrorPhone") {
              Swal.fire({
                icon: "warning",
                title: "Terjadi Kesalahan",
                text: "Telepon yang anda masukkan bukan angka.",
              });
            } else {
              Toast.fire({
                icon: "success",
                title: "Candidate has been updated!",
              });
            }
            this.closeModal();
          },
        }
      );
    },
    deleteCandidate(candidate) {
      Swal.fire({
        title: "Are you sure?",
        text: "You won't be able to revert this!",
        icon: "warning",
        showCancelButton: true,
        confirmButtonColor: "#3085d6",
        cancelButtonColor: "#d33",
        confirmButtonText: "Yes, delete it!",
      }).then((result) => {
        if (result.isConfirmed) {
          this.form.delete(this.route("admin.candidates.destroy", candidate), {
            preserveScroll: true,
            onSuccess: () => {
              Swal.fire("Deleted!", "Candidate has been deleted.", "success");
            },
          });
        }
      });
    },
  },
};
</script>
