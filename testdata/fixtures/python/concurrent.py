# executor.map is lazy: exceptions surface only when the results are
# read, so dropping them hides failures. Flag unconsumed maps inside a
# ThreadPoolExecutor; reading the results raises properly.
import concurrent.futures


def flag_dropped(make):
    with concurrent.futures.thread.ThreadPoolExecutor() as executor:
        # ruleid: uncaught-executor-exceptions
        executor.map(make, [1, 2])


def flag_dropped_two(make):
    with concurrent.futures.thread.ThreadPoolExecutor() as executor:
        # ruleid: uncaught-executor-exceptions
        executor.map(make, [3, 4])


def flag_dropped_three(make):
    with concurrent.futures.thread.ThreadPoolExecutor() as executor:
        # ruleid: uncaught-executor-exceptions
        executor.map(make, [5, 6])


def safe_consumed(make):
    with concurrent.futures.thread.ThreadPoolExecutor() as executor:
        # ok: uncaught-executor-exceptions
        for result in executor.map(make, [1, 2]):
            print(result)


def safe_list(make):
    with concurrent.futures.thread.ThreadPoolExecutor() as executor:
        # ok: uncaught-executor-exceptions
        done = [r for r in executor.map(make, [1, 2])]


def safe_assigned(make):
    with concurrent.futures.thread.ThreadPoolExecutor() as executor:
        # ok: uncaught-executor-exceptions
        results = executor.map(make, [1, 2])
        for _ in results:
            pass
