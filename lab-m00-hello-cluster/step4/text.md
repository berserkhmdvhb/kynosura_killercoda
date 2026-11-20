# Verify

Run the checks. A passing run prints one `PASS` line per check.


A failing check prints a `FAIL` line and a hint line under it. Fix that one thing and run `shelf verify` again.

Click **Check**. It passes when every check of the lab passes.

## Stuck?

Run `shelf hint lab-m00-hello-cluster 1` in the terminal, or open a hint below. Each is stronger than the one before.

<details><summary>Hint 1</summary>

Run `shelf up`, then `kubectl get nodes`. A node that says Ready is working.

</details>

<details><summary>Hint 2</summary>

If `shelf up` fails, check that Docker is running (`docker version` shows a Server section), then run it again.

</details>
