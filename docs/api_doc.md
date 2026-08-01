# PIIRS Backend API Documentation

**Base URL**

```
https://public-infrastructure-issue-reporti-pearl.vercel.app/
```

**Authentication**

Protected APIs require a Firebase ID Token.

```
Authorization: Bearer <Firebase_ID_Token>
```

---

# 1. Health Check

## GET /

### Description

Check whether the backend server is running.

### Authentication

❌ No

### Response

```json
"server is live"
```

---

# 2. Payments

---

## POST /create-checkout-session

### Description

Create a Stripe checkout session for purchasing Premium membership.

### Authentication

✅ Required

### Request Body

None

### Response

```json
{
  "url": "https://checkout.stripe.com/...",
  "id": "cs_test_..."
}
```

---

## PATCH /payment-success

### Description

Verify Stripe payment and upgrade the user to Premium.

### Authentication

❌ No

### Query Parameters

| Name       | Type   |
| ---------- | ------ |
| session_id | String |

### Response

```json
{
  "success": true,
  "transactionId": "...",
  "paymentId": "...",
  "userEmail": "user@email.com"
}
```

---

# 3. Users

---

## GET /users

### Description

Retrieve all users.

### Authentication

❌ No

### Query Parameters

| Name  | Description     |
| ----- | --------------- |
| limit | Number of users |
| sort  | createdAt_desc  |

---

## GET /users/:email/role

### Description

Retrieve user information and role.

### Authentication

❌ No

### Path Parameter

```
email
```

---

## POST /users

### Description

Register a new citizen.

### Authentication

Firebase Token Required

### Request Body

```json
{
  "name": "John Doe",
  "photoURL": "https://..."
}
```

---

## PATCH /users/:id/isBlocked

### Description

Block or unblock a user.

### Authentication

❌ No (Current Implementation)

### Request Body

```json
{
  "isBlcoked": true
}
```

---

## GET /users/:role/staffs

### Description

Get all staff users.

### Authentication

✅ Admin

### Example

```
GET /users/staff/staffs
```

---

## POST /users/add-staff

### Description

Create a new staff account.

### Authentication

✅ Admin

### Request Body

```json
{
  "name": "John",
  "email": "john@mail.com",
  "password": "123456",
  "photoURL": "",
  "phone": "",
  "address": ""
}
```

---

# 4. Issues

---

## GET /issues

### Description

Retrieve public issues.

### Authentication

❌ No

### Query Parameters

| Name      | Description           |
| --------- | --------------------- |
| limit     | Limit results         |
| sort      | createdAt_desc        |
| status    | Filter status         |
| priority  | Filter priority       |
| isBoosted | Filter boosted issues |

---

## GET /issues/all

### Description

Retrieve every issue.

### Authentication

❌ No

---

## GET /issues/all/admin

### Description

Retrieve every issue for admin.

### Authentication

✅ Admin

---

## GET /issues/details/:id

### Description

Retrieve issue details.

### Authentication

❌ No

---

## POST /issues

### Description

Create a new issue.

### Authentication

✅ Required

### Request Body

```json
{
  "title": "",
  "description": "",
  "category": "",
  "location": "",
  "image": ""
}
```

### Default Values

```
status = pending

priority = normal

isBoosted = false

upvotes = 0

createdBy = logged in user

createdAt = current date
```

---

## PATCH /issues/:issueId/status

### Description

Update issue status.

### Authentication

✅ Staff

### Request Body

```json
{
  "status": "resolved"
}
```

---

## GET /my-issues

### Description

Retrieve issues created by the logged-in user.

### Authentication

✅ Required

---

## GET /issues/user/:email

### Description

Retrieve issues by user.

### Authentication

✅ Required

### Query Parameters

```
limit
```

---

## GET /issues/:staffEmail/assinedTask

### Description

Retrieve tasks assigned to a staff member.

### Authentication

✅ Staff

### Query Parameters

```
today=true
```

---

## POST /issues/:selectedIssueId/assign

### Description

Assign an issue to a staff member.

### Authentication

✅ Admin

### Request Body

```json
{
  "staffEmail": "staff@email.com"
}
```

---

## PATCH /issues/:id/upvote

### Description

Toggle issue upvote.

### Authentication

✅ Required

### Behavior

* Add Upvote
* Remove Upvote
* Increase Count
* Decrease Count

---

# 5. Dashboard APIs

---

## GET /dashboard/admin/stats

### Description

Retrieve admin dashboard statistics.

### Authentication

✅ Admin

### Returns

* Total Issues
* Pending Issues
* Resolved Issues
* Rejected Issues
* Total Payments
* Revenue
* Last 7 Days Activity

---

## GET /dashboard/staff/:email/stats

### Description

Retrieve staff dashboard statistics.

### Authentication

✅ Staff

### Returns

* Assigned Tasks
* Open Tasks
* Resolved Tasks
* Assigned To You
* Average Response Time
* Last 7 Days Activity

---

## GET /dashboard/citizen/:email/stats

### Description

Retrieve citizen dashboard statistics.

### Authentication

✅ Required

### Returns

* Submitted Issues
* Pending Issues
* Open Issues
* Resolved Issues
* Upvotes Given
* Block Status
* Last 7 Days Activity

---

# Authentication Matrix

| Endpoint                             | Citizen |  Staff  |       Admin       |
| ------------------------------------ | :-----: | :-----: | :---------------: |
| GET /                                |    ✅    |    ✅    |         ✅         |
| POST /create-checkout-session        |    ✅    |    ✅    |         ✅         |
| PATCH /payment-success               |    ✅    |    ✅    |         ✅         |
| GET /users                           |    ✅    |    ✅    |         ✅         |
| GET /users/:email/role               |    ✅    |    ✅    |         ✅         |
| POST /users                          |    ✅    |    ✅    |         ✅         |
| PATCH /users/:id/isBlocked           |    ❌    |    ❌    | ✅ *(Recommended)* |
| GET /users/:role/staffs              |    ❌    |    ❌    |         ✅         |
| POST /users/add-staff                |    ❌    |    ❌    |         ✅         |
| GET /issues                          |    ✅    |    ✅    |         ✅         |
| GET /issues/all                      |    ✅    |    ✅    |         ✅         |
| GET /issues/all/admin                |    ❌    |    ❌    |         ✅         |
| GET /issues/details/:id              |    ✅    |    ✅    |         ✅         |
| POST /issues                         |    ✅    |    ✅    |         ✅         |
| PATCH /issues/:issueId/status        |    ❌    |    ✅    |         ✅         |
| GET /my-issues                       |    ✅    |    ✅    |         ✅         |
| GET /issues/user/:email              | ✅ (Own) | ✅ (Own) |         ✅         |
| GET /issues/:staffEmail/assinedTask  |    ❌    |    ✅    |         ✅         |
| POST /issues/:selectedIssueId/assign |    ❌    |    ❌    |         ✅         |
| PATCH /issues/:id/upvote             |    ✅    |    ✅    |         ✅         |
| GET /dashboard/admin/stats           |    ❌    |    ❌    |         ✅         |
| GET /dashboard/staff/:email/stats    |    ❌    |    ✅    |         ✅         |
| GET /dashboard/citizen/:email/stats  |    ✅    |    ✅    |         ✅         |

---

# Total API Count

| Module    |        APIs |
| --------- | ----------: |
| Health    |           1 |
| Payments  |           2 |
| Users     |           6 |
| Issues    |          11 |
| Dashboard |           3 |
| **Total** | **23 APIs** |
