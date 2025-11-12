# Client Platform — Overview & MVP

## 1) Overview (What we’re doing)

**Vision:** Build a trainer–client ecosystem where clients receive clear, personalized workout guidance, can log effortlessly (even offline), and see tangible progress that keeps them engaged.

**Problem we’re solving:** Clients get generic plans and lose motivation without feedback or accountability. They need simple, reliable guidance and proof of progress.

**Solution in one line:** A focused client app that delivers assigned workouts, frictionless logging, and meaningful progress visuals—kept in sync with the trainer’s program in real time.

**Why us (USP):** Unlike generic consumer fitness apps or trainer-only tools, we connect the professional program (trainer) with an ultra-simple client execution experience, closing the loop with data, insights, and feedback.

**North-star outcomes:**

* Higher client adherence to assigned plans
* Faster time-to-first-workout and lower drop-off after Week 1
* Clear, motivating progress signals that drive retention

---

## 2) What we’re building (Client app)

**Core capabilities (MVP-first):**

1. **Assigned Workouts**: View today’s/this week’s program with clear status (due, upcoming, missed).
2. **Workout Player & Logging**: Guided flow per exercise (sets/reps/tempo), timed rest, quick edits/substitutions, offline logging with sync.
3. **Progress & History**: Personal records, volume/rep trends, streaks, adherence %.
4. **Exercise Library (Read-only)**: Form cues + media; searchable by muscle/equipment.
5. **Lightweight Communication**: Notes on workouts + trainer feedback surface (read/send simple messages tied to sessions).
6. **Reminders & Notifications**: Start-of-day nudge, missed-workout recovery, PR celebration.
7. **Account & Onboarding**: Invite acceptance, goals, injuries/equipment, time availability.

**Explicitly out-of-scope for client MVP:** Nutrition tracking, social feed/communities, payment and marketplace, advanced analytics dashboards, wearables integration.

**Experience principles:**

* One-tap start; minimal typing
* Works great offline; never lose a log
* Show progress early and often
* Accessible (WCAG 2.2 AA), large touch targets, clear contrast

---

## 3) Who it’s for

**Primary persona:** Clients actively training with a certified trainer who assigns programs; smartphone-native; values accountability and clarity.

**Secondary persona:** Motivated self-starters purchasing templated programs from trainers (future; not MVP-critical).

**Jobs-to-be-done (client):**

* *When I open the app*, I want to know exactly what to do today and how long it will take.
* *While training*, I want effortless logging that doesn’t slow me down.
* *After training*, I want to see improvement so I stay motivated.
* *If I miss a day*, I want smart recovery options (nudge, reschedule, substitute).

**Accessibility & inclusivity:** Screen-reader support, dyslexia-friendly labels, haptics/sound cues for timers, metric/imperial units, left-handed control considerations.

---

## 4) General MVP (Client)

**Goal:** Ship the shortest path to value: assigned workouts → frictionless logging → visible progress.

**MVP scope:**

* **Home / Today**: Today’s workout card, adherence streak, next-up preview.
* **Workouts**: Weekly plan, statuses (due/upcoming/missed), quick reschedule.
* **Workout Player**: Exercise steps with media thumbnail, prescribed sets/reps/tempo, rest timer, log inputs, substitutions, notes to trainer; offline-first.
* **Progress**: Basic charts (est. 1RM, total volume, best sets), PR badges, history list.
* **Exercise Library**: Search/filter, detail sheet with cues/media.
* **Notifications**: Reminders, PRs, trainer adjustments.
* **Profile**: Goals, injuries/equipment, units, notification prefs; secure auth.

**Technical MVP essentials:** Flutter (iOS/Android), Supabase auth & realtime, cached media, offline queue + conflict resolution for logs.

**Non-functional targets:** startup <3s; input latency <100ms; sync <5s; AA accessibility.

**Success metrics (client-side):**

* **Activation:** % invited users who complete first workout within 48h
* **Adherence:** ≥70% of assigned workouts completed weekly (per PRD)
* **Retention:** D30 client retention ≥50% within trainer-managed cohorts
* **Engagement:** Avg. 3+ workouts logged/user/week in active cohorts

**What we will *not* do in MVP:** advanced analytics, in-depth nutrition, community feed, payment flows.

---

## 5) Key user flows (Client)

1. **Onboarding → First Workout**
   Invite link → sign in → consent & goals → equipment & availability → Home shows “Today’s Workout” → start.

2. **Workout Execution & Logging**
   Warm-up (optional) → Exercise card with instructions → set-by-set logging → rest timer → notes → complete workout → success animation.

3. **Missed Workout Recovery**
   Detect miss → smart prompt (reschedule, compress week, substitute) → update plan.

4. **Progress Review**
   From Home or Progress tab → week-over-week completion, PR banner, trend mini-charts.

5. **Light Messaging**
   Add note on a set/exercise → trainer sees context; client can read replies and send short messages.

---

## 6) Screens & IA (Client)

* **Home (Today)**: Today card, streak, quick actions (Start / Reschedule), next-up.
* **Workouts**: Calendar/week view, filters (Assigned/Completed/Missed).
* **Workout Player**: Exercise list, per-exercise detail, rest timer, substitution panel, notes.
* **Progress**: Summary KPIs, PRs, trend charts (volume, e1RM), history list.
* **Exercise Library**: Search, filters (muscle/equipment), detail with media.
* **Profile & Settings**: Goals, units, notifications, privacy, sign-out.
* **Notifications Center**: Recent nudges, trainer edits, PRs.

---

## 7) Acceptance criteria (Client MVP)

* **Assigned Workouts visible:** After login with a valid invite, client sees at least one workout with correct sets/reps/tempo.
* **Logging:** Client can complete a workout offline; data syncs automatically when online with no data loss.
* **Substitutions:** Client can change an exercise using allowed filters (equipment/muscle) and still complete the workout.
* **Timers & Haptics:** Rest timer runs in foreground/background with haptic/audio cue.
* **Progress:** Client can view total volume over last 4 weeks, PRs, and adherence %.
* **Notes to Trainer:** Notes saved per exercise and visible to trainer with timestamp.
* **Accessibility:** All touch targets ≥44px, key screens readable by screen reader.

---

## 8) Data model (client-facing)

* **User** (id, name, avatar, goals, units)
* **ProgramAssignment** (id, userId, programId, startDate, status)
* **Workout** (id, date, status: assigned/completed/missed)
* **WorkoutExercise** (id, workoutId, exerciseId, prescription: sets/reps/tempo/weightRange)
* **SetLog** (id, workoutExerciseId, reps, weight, RPE?, notes, timestamp, offlineFlag)
* **Exercise** (id, name, muscleGroups[], equipment[], mediaUrl, cues[])
* **ProgressSnapshot** (date, totalVolume, est1RMByLift, PRs[])
* **Message** (threadId, authorId, body, context: workoutId/exerciseId, createdAt)

---

## 9) Technical notes

* **Offline-first:** Local queue + conflict resolution (last-write-wins for logs; versioned workouts on trainer edits).
* **Media:** Thumb-first loading; adaptive bitrate; optional offline caching.
* **Security & Privacy:** Role-based access; encrypted transport; consider HIPAA-adjacent safeguards.
* **Observability:** Client events for activation, adherence, drop-off points.

---

## 10) Rollout plan

* **Beta (Weeks 0–4):** 5–10 trainers, ≤100 clients. Focus: stability, logging UX, sync correctness.
* **MVP GA (Weeks 5–8):** Broader access, add PRs & basic trends, refine notifications.
* **Post-MVP:** Wearables import (read-only), deeper insights, nutrition module (phase 2).

---
