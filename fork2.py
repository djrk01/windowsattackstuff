import multiprocessing
import time

def worker():
    print(f"Worker process {multiprocessing.current_process().name} started.")
    time.sleep(1)  # Simulate some work
    print(f"Worker process {multiprocessing.current_process().name} finished.")

if __name__ == "__main__":
    # Create a list to hold the process objects
    processes = []

    # Create a limited number of worker processes
    for _ in range(10000):
        p = multiprocessing.Process(target=worker)
        processes.append(p)
        p.start()

    # Wait for all worker processes to finish
    for p in processes:
        p.join()

    print("All worker processes have finished.")
